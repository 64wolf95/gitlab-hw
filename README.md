# Домашнее задание к занятию "`Уязвимости и атаки на информационные системы`" - `Тесаев Максим`

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

Скачайте и установите виртуальную машину Metasploitable: [Ссылка](https://sourceforge.net/projects/metasploitable/).  
Это типовая ОС для экспериментов в области информационной безопасности, с которой следует начать при анализе уязвимостей.  
Просканируйте эту виртуальную машину, используя nmap.  
Попробуйте найти уязвимости, которым подвержена эта виртуальная машина.  
Сами уязвимости можно поискать на сайте [Ссылка](https://www.exploit-db.com/).  
Для этого нужно в поиске ввести название сетевой службы, обнаруженной на атакуемой машине, и выбрать подходящие по версии уязвимости.  
Ответьте на следующие вопросы:  
* Какие сетевые службы в ней разрешены?  
* Какие уязвимости были вами обнаружены? (список со ссылками: достаточно трёх уязвимостей)  
*Приведите ответ в свободной форме.*  

### Решение

**Какие сетевые службы в ней разрешены?**  
```java
root@wolf-VirtualBox:~# nmap -sS -sV -A -p- 192.168.1.144
Starting Nmap 7.94SVN ( https://nmap.org ) at 2025-10-23 22:53 +04
Nmap scan report for 192.168.1.144
Host is up (0.0011s latency).
Not shown: 65505 closed tcp ports (reset)
PORT      STATE SERVICE     VERSION
21/tcp    open  ftp         vsftpd 2.3.4
22/tcp    open  ssh         OpenSSH 4.7p1 Debian 8ubuntu1 (protocol 2.0)
23/tcp    open  telnet      Linux telnetd
25/tcp    open  smtp        Postfix smtpd
53/tcp    open  domain      ISC BIND 9.4.2
80/tcp    open  http        Apache httpd 2.2.8 ((Ubuntu) DAV/2)
111/tcp   open  rpcbind     2 (RPC #100000)
139/tcp   open  netbios-ssn Samba smbd 3.X - 4.X (workgroup: WORKGROUP)
445/tcp   open  netbios-ssn Samba smbd 3.0.20-Debian (workgroup: WORKGROUP)
512/tcp   open  exec        netkit-rsh rexecd
513/tcp   open  login       OpenBSD or Solaris rlogind
514/tcp   open  tcpwrapped
1099/tcp  open  java-rmi    GNU Classpath grmiregistry
1524/tcp  open  bindshell   Metasploitable root shell
2049/tcp  open  nfs         2-4 (RPC #100003)
2121/tcp  open  ftp         ProFTPD 1.3.1
3306/tcp  open  mysql       MySQL 5.0.51a-3ubuntu5
3632/tcp  open  distccd     distccd v1 ((GNU) 4.2.4 (Ubuntu 4.2.4-1ubuntu4))
5432/tcp  open  postgresql  PostgreSQL DB 8.3.0 - 8.3.7
5900/tcp  open  vnc         VNC (protocol 3.3)
6667/tcp  open  irc         UnrealIRCd
6697/tcp  open  irc         UnrealIRCd
8009/tcp  open  ajp13       Apache Jserv (Protocol v1.3)
8180/tcp  open  http        Apache Tomcat/Coyote JSP engine 1.1
8787/tcp  open  drb         Ruby DRb RMI (Ruby 1.8; path /usr/lib/ruby/1.8/drb)
37613/tcp open  java-rmi    GNU Classpath grmiregistry
42940/tcp open  mountd      1-3 (RPC #100005)
51533/tcp open  nlockmgr    1-4 (RPC #100021)
51585/tcp open  status      1 (RPC #100024)
```

**Какие уязвимости были вами обнаружены? (список со ссылками: достаточно трёх уязвимостей)**  
```java
root@wolf-VirtualBox:/tmp# nmap -sS -sV --script=vulners --script-args mincvss=5.0 -p21,22,80 192.168.1.144
Starting Nmap 7.94SVN ( https://nmap.org ) at 2025-10-23 23:04 +04
Nmap scan report for 192.168.1.144
Host is up (0.00037s latency).

PORT   STATE SERVICE VERSION
21/tcp open  ftp     vsftpd 2.3.4
| vulners: 
|   vsftpd 2.3.4: 
|     	PACKETSTORM:162145	10.0	https://vulners.com/packetstorm/PACKETSTORM:162145	*EXPLOIT*
|     	EDB-ID:49757	10.0	https://vulners.com/exploitdb/EDB-ID:49757	*EXPLOIT*
|     	E9B0AEBB-5138-50BF-8922-2D87E3C046DD	10.0	https://vulners.com/githubexploit/E9B0AEBB-5138-50BF-8922-2D87E3C046DD	*EXPLOIT*
22/tcp open  ssh     OpenSSH 4.7p1 Debian 8ubuntu1 (protocol 2.0)
| vulners: 
|   cpe:/a:openbsd:openssh:4.7p1: 
|     	DF059135-2CF5-5441-8F22-E6EF1DEE5F6E	10.0	https://vulners.com/gitee/DF059135-2CF5-5441-8F22-E6EF1DEE5F6E	*EXPLOIT*
|     	PACKETSTORM:173661	9.8	https://vulners.com/packetstorm/PACKETSTORM:173661	*EXPLOIT*
|     	F0979183-AE88-53B4-86CF-3AF0523F3807	9.8	https://vulners.com/githubexploit/F0979183-AE88-53B4-86CF-3AF0523F3807	*EXPLOIT*
80/tcp open  http    Apache httpd 2.2.8 ((Ubuntu) DAV/2)
|_http-server-header: Apache/2.2.8 (Ubuntu) DAV/2
| vulners: 
|   cpe:/a:apache:http_server:2.2.8: 
|     	SSV:69341	10.0	https://vulners.com/seebug/SSV:69341	*EXPLOIT*
|     	SSV:19282	10.0	https://vulners.com/seebug/SSV:19282	*EXPLOIT*
|     	SSV:19236	10.0	https://vulners.com/seebug/SSV:19236	*EXPLOIT*
```

---

### Задание 2

Проведите сканирование Metasploitable в режимах SYN, FIN, Xmas, UDP.  
Запишите сеансы сканирования в Wireshark.  
Ответьте на следующие вопросы:  
* Чем отличаются эти режимы сканирования с точки зрения сетевого трафика?  
* Как отвечает сервер?  
*Приведите ответ в свободной форме.*

### Решение

**Чем отличаются эти режимы сканирования с точки зрения сетевого трафика?**  
1. SYN scan (-sS)  
* Что отправляет сканер: одиночный TCP пакет с флагом SYN (без установки полного соединения).  
* Ожидаемый ответ сервера:  
* SYN/ACK → порт open (сканер посылает RST, чтобы не завершать TCP handshake и не устанавливать сессию).  
* RST (или RST/ACK) → порт closed.  
* Wireshark: увидишь пары SYN -> SYN/ACK для открытых; SYN -> RST для закрытых.  
* Интерпретация: быстрый, надёжный; может быть обнаружен IDS, но не устанавливает полноценные соединения.  
2. FIN scan (-sF)  
* Что отправляет сканер: TCP пакет с флагом FIN (нет SYN).  
* Ожидаемый ответ сервера (по RFC):  
* Если порт закрыт: стек TCP должен ответить RST.  
* Если порт открыт: нет ответа (стек «игнорирует» неожиданный FIN для открытого TCP, если приложение не ожидает), т.е. silence.  
* Практическая заметка: многие современные стеки/фаерволы не следуют строго RFC — поведение может отличаться (например Windows часто отвечает RST даже для открытого порта).  
* Wireshark: FIN -> RST (closed) или FIN -> (no response) (open/filtered).  
3. Xmas scan (-sX) (FIN+PSH+URG)  
* Что отправляет: TCP пакет с флагами FIN + PSH + URG (в «свечах» — Xmas).  
* Ожидаемый ответ: аналогичен FIN-scan:  
* RST → порт closed  
* нет ответа → порт open или фильтрованный  
* Примечание: Xmas и Null (без флагов) используют тот же принцип «пассивного» определения — полагаются на отсутствие ответа для открытых портов.  
* Wireshark: увидишь TCP с FIN/PSH/URG из твоей машины, затем либо RST от цели, либо тишину.  
4. UDP scan (-sU)  
* Что отправляет сканер: UDP датаграмму (часто пустую или с небольшим полезным содержимым) на проверяемый порт.  
* Ожидаемые ответы:  
   * ICMP Port Unreachable (Type 3, Code 3) → порт closed.  
   * UDP ответ / сервисный ответ → порт open (например DNS вернёт UDP-пакет).  
   * Отсутствие ответа → open|filtered (может быть open и молчит, либо пакеты фильтруются/теряются).  
* Wireshark: ищи UDP запросы и ICMP type 3 responses. Часто много ICMP rate-limiting / unreachable suppressed — это усложняет анализ.  
* Практическая заметка: UDP-сканы медленны и ненадёжны; фаерволы часто блокируют ICMP, что делает большое число портов «open|filtered».  

**Как отвечает сервер?**  
* При UDP сканировании - ICMP пакетыми с кодом ошибок (порт закрыт) или UDP пакетом (порт открыт). Нет ответа - вероятно, порт открыт.  
* SYN сканирование - TCP [SYN, ACK] (порт открыт) [RST, ACK], [RST] (порт закрыт) пакеты.  
* FIN сканирование - TCP [RST, ACK] пакеты (порт закрыт).  
* Xmas сканирование - TCP [RST, ACK] пакеты (порт закрыт).
