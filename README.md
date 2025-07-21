<<<<<<< HEAD
# Домашнее задание к занятию "`GitLab`" - `Тесаев Максим`
=======
# Домашнее задание к занятию "`Система мониторинга Zabbix`" - `Тесаев Максим`
>>>>>>> e2c4269 (Добавлено решение домашнего задания в README.md)


### Инструкция по выполнению домашнего задания

   1. Сделайте `fork` данного репозитория к себе в Github и переименуйте его по названию или номеру занятия, например, https://github.com/имя-вашего-репозитория/git-hw или  https://github.com/имя-вашего-репозитория/7-1-ansible-hw).
   2. Выполните клонирование данного репозитория к себе на ПК с помощью команды `git clone`.
   3. Выполните домашнее задание и заполните у себя локально этот файл README.md:
      - впишите вверху название занятия и вашу фамилию и имя
      - в каждом задании добавьте решение в требуемом виде (текст/код/скриншоты/ссылка)
      - для корректного добавления скриншотов воспользуйтесь [инструкцией "Как вставить скриншот в шаблон с решением](https://github.com/netology-code/sys-pattern-homework/blob/main/screen-instruction.md)
      - при оформлении используйте возможности языка разметки md (коротко об этом можно посмотреть в [инструкции  по MarkDown](https://github.com/netology-code/sys-pattern-homework/blob/main/md-instruction.md))
   4. После завершения работы над домашним заданием сделайте коммит (`git commit -m "comment"`) и отправьте его на Github (`git push origin`);
   5. Для проверки домашнего задания преподавателем в личном кабинете прикрепите и отправьте ссылку на решение в виде md-файла в вашем Github.
   6. Любые вопросы по выполнению заданий спрашивайте в чате учебной группы и/или в разделе “Вопросы по заданию” в личном кабинете.
   
Желаем успехов в выполнении домашнего задания!
   
### Дополнительные материалы, которые могут быть полезны для выполнения задания

1. [Руководство по оформлению Markdown файлов](https://gist.github.com/Jekins/2bf2d0638163f1294637#Code)

---

### Задание 1

<<<<<<< HEAD
Что нужно сделать:

1. Разверните GitLab локально, используя Vagrantfile и инструкцию, описанные в этом репозитории.
2. Создайте новый проект и пустой репозиторий в нём.

![Скриншот 8-4.0](screenshots/8-4.0.png)

3. Зарегистрируйте gitlab-runner для этого проекта и запустите его в режиме Docker. Раннер можно регистрировать и запускать на той же виртуальной машине, на которой запущен GitLab.
В качестве ответа в репозиторий шаблона с решением добавьте скриншоты с настройками раннера в проекте.

![Скриншот 8-4.1.1](screenshots/8-4.1.1.png)
![Скриншот 8-4.1.2](screenshots/8-4.1.2.png)
![Скриншот 8-4.2.1](screenshots/8-4.2.1.png)
=======
Установите Zabbix Server с веб-интерфейсом.

**Процесс выполнения**
1. Выполняя ДЗ, сверяйтесь с процессом отражённым в записи лекции.
2. Установите PostgreSQL. Для установки достаточна та версия, что есть в системном репозитороии Debian 11.
3. Пользуясь конфигуратором команд с официального сайта, составьте набор команд для установки последней версии Zabbix с поддержкой PostgreSQL и Apache.
4. Выполните все необходимые команды для установки Zabbix Server и Zabbix Web Server.

**Требования к результатам**
1. Прикрепите в файл README.md скриншот авторизации в админке.
2. Приложите в файл README.md текст использованных команд в GitHub.

### Решение

![Скриншот 8-03_1](screenshots/8-03_1.png)
![Скриншот 8-03.2](screenshots/8-03.2.png)
![Скриншот 8-03.3](screenshots/8-03.3.png)
![Скриншот 8-03.4](screenshots/8-03.4.png)

*wget https://repo.zabbix.com/zabbix/6.0/debian/pool/main/z/zabbix-release/zabbix-release_latest_6.0+debian11_all.deb*
*dpkg -i zabbix-release_latest_6.0+debian11_all.deb*
*apt update*
*apt install zabbix-server-pgsql zabbix-frontend-php php7.4-pgsql zabbix-apache-conf zabbix-sql-scripts zabbix-agent*
*sudo -u postgres createuser --pwprompt zabbix*
*zcat /usr/share/zabbix-sql-scripts/postgresql/server.sql.gz | sudo -u zabbix psql zabbix*
*systemctl restart zabbix-server zabbix-agent apache2*
*systemctl enable zabbix-server zabbix-agent apache2*
>>>>>>> e2c4269 (Добавлено решение домашнего задания в README.md)

---

### Задание 2

<<<<<<< HEAD
Что нужно сделать:

1. Запушьте репозиторий на GitLab, изменив origin. Это изучалось на занятии по Git.

![Скриншот 8-4.3](screenshots/8-4.3.png)

2. Создайте .gitlab-ci.yml, описав в нём все необходимые, на ваш взгляд, этапы.
В качестве ответа в шаблон с решением добавьте:

- файл gitlab-ci.yml для своего проекта или вставьте код в соответствующее поле в шаблоне;
- скриншоты с успешно собранными сборками.

![Скриншот 8-4.4](screenshots/8-4.4.png)
![Скриншот 8-4.5](screenshots/8-4.5.png)
![Скриншот 8-4.6](screenshots/8-4.6.png)

=======
Установите Zabbix Agent на два хоста.

**Процесс выполнения**
1. Выполняя ДЗ, сверяйтесь с процессом отражённым в записи лекции.
2. Установите Zabbix Agent на 2 вирт.машины, одной из них может быть ваш Zabbix Server.
3. Добавьте Zabbix Server в список разрешенных серверов ваших Zabbix Agentов.
4. Добавьте Zabbix Agentов в раздел Configuration > Hosts вашего Zabbix Servera.
5. Проверьте, что в разделе Latest Data начали появляться данные с добавленных агентов.

**Требования к результатам**
1. Приложите в файл README.md скриншот раздела Configuration > Hosts, где видно, что агенты подключены к серверу
2. Приложите в файл README.md скриншот лога zabbix agent, где видно, что он работает с сервером
3. Приложите в файл README.md скриншот раздела Monitoring > Latest data для обоих хостов, где видны поступающие от агентов данные.
4. Приложите в файл README.md текст использованных команд в GitHub

### Решение

![Скриншот 8-03.5](screenshots/8-03.5.png)
![Скриншот 8-03.6](screenshots/8-03.6.png)
![Скриншот 8-03.7](screenshots/8-03.7.png)
![Скриншот 8-03.8](screenshots/8-03.8.png)
![Скриншот 8-03.9](screenshots/8-03.9.png)

*wget https://repo.zabbix.com/zabbix/6.0/debian/pool/main/z/zabbix-release/zabbix-release_latest_6.0+debian11_all.deb*
*dpkg -i zabbix-release_latest_6.0+debian11_all.deb*
*apt update*
*apt install zabbix-agent*
*systemctl restart zabbix-agent*
*systemctl enable zabbix-agent*
>>>>>>> e2c4269 (Добавлено решение домашнего задания в README.md)
