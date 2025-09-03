variable "flow" {
  type    = string
  default = "21-06"
}

variable "cloud_id" {
  type    = string
  default = "b1g6ds7t3o1jsv2ve563"
}
variable "folder_id" {
  type    = string
  default = "b1gnoes2tt751qfg2ckh"
}

variable "test" {
  type = map(number)
  default = {
    cores         = 2
    memory        = 1
    core_fraction = 20
  }
}
