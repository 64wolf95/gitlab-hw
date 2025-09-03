# main.tf — Создание двух ВМ, целевой группы и сетевого балансировщика

# Образ Ubuntu 24.04 LTS
data "yandex_compute_image" "ubuntu_2404" {
  family = "ubuntu-2404-lts-oslogin"
}

# Переменная для количества ВМ
locals {
  vm_count = 2
}

# Создаём 2 идентичные ВМ через count
resource "yandex_compute_instance" "web" {
  count        = local.vm_count
  name         = "web-${count.index + 1}"
  hostname     = "web-${count.index + 1}"
  platform_id  = "standard-v3"
  zone         = "ru-central1-a"

  resources {
    cores         = 2
    memory        = 1
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_2404.image_id
      type     = "network-hdd"
      size     = 10
    }
  }

  metadata = {
    user-data          = file("./cloud-init.yml")
    serial-port-enable = 1
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop_a.id
    nat                = false
    security_group_ids = [yandex_vpc_security_group.LAN.id, yandex_vpc_security_group.web_sg.id]
  }
}

# Создаём целевую группу и добавляем в неё обе ВМ
resource "yandex_lb_target_group" "web_tg" {
  name      = "web-target-group-${var.flow}"
  region_id = "ru-central1"

  dynamic "target" {
    for_each = yandex_compute_instance.web[*].id
    content {
      subnet_id = yandex_vpc_subnet.develop_a.id
      address   = yandex_compute_instance.web[target.key].network_interface[0].ip_address
    }
  }
}

# Создаём сетевой балансировщик нагрузки
resource "yandex_lb_network_load_balancer" "nlb" {
  name = "web-nlb-${var.flow}"

  listener {
    name        = "http-listener"
    port        = 80
    target_port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.web_tg.id

    healthcheck {
      name = "http-healthcheck"
      http_options {
        port = 80
        path = "/"
      }
    }
  }
}
