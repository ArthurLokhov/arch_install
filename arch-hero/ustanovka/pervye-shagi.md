---
description: Все с чего-то начинали.
---

# 1⃣ Первые шаги

## Подключение интернета

Сделаем самый важный шаг - подключим Интернет. Тут есть три варианта развития событий:

* Если у вас проводной интернет, то ничего делать не надо.
* Если у вас встроенный Wi-Fi модуль, то нужно выполнить команды, которые будут ниже.
* Если у вас внешний Wi-Fi модуль, то тут как повезет. К примеру продукция от TP-Link не работает без драйверов и перед тем, как начинать следующий шаг, нужно будет поставить драйвера (См. [Драйвера](../draivera.md)).

&#x20;Проверим какие сети доступны.

```shell
ip link
```

Результат будет примерно такой:

```shell
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: eno1: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc fq_codel state DOWN mode DEFAULT group default qlen 1000
    link/ether d8:bb:c1:e0:e7:7b brd ff:ff:ff:ff:ff:ff
    altname enp0s31f6
3: wlp3s0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN mode DORMANT group default qlen 1000
    link/ether 7e:c4:a7:76:78:d0 brd ff:ff:ff:ff:ff:ff permaddr f4:a4:75:87:41:37
4: wlp0s20f0u5: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 2312 qdisc mq state UP mode DORMANT group default qlen 1000
    link/ether 28:87:ba:e2:39:42 brd ff:ff:ff:ff:ff:ff
```

1. **lo**: Локальная сеть, которая привязана к загрузочной флешке, а позже к компьютеру. Позволяет подключиться к другим устройствам этой же сети.
2. **eno**: Проводной интернет.
3. **wlp**: Wi-Fi модуль. У меня их два: встроенный(**wlp3s0**) и внешний(**wlp0s20f0u5**).&#x20;

Подключение по Wi-Fi выполняется при помощи утилиты iwctl.

```shell
iwctl

```

_Внутри iwctl_: Получим название нашего Wi-Fi модуля

```shell
device list
```

_Внутри iwctl_: Сканируем окружение на наличие интернет-сетей, а затем выводим результат и выходим из утилиты iwctl. В качестве **\<wlan>** используйте, полученное вами название. К примеру: **wlan0**.

```shell
station <wlan> scan
station <wlan> get-networks
exit
```

Теперь мы может подключиться к Wi-Fi сети. \<SSID> - название интернет-сети, \<wlan> - название нашего модуля, \<password> - тут понятно

```shell
iwctl --passphrase <password> station <wlan> connect <SSID>
```

Проверяем наше соединение.

```shell
ping www.archlinux.org -c 5
```

## Настройка даты и времени

Сначала получим информацию о текущих дате и времени при помощи timedatectl.

```shell
timedatectl status
```

Видно, что в качестве часового пояса стоит универсальное время - UTC. Поменяем на наше - Московское.

```shell
timedatectl set-timezone Europe/Moscow
timedatectl status
```

Если вам надо поставить другой часовой пояс, то перечень всех поясов можно посмотреть следующим образом.

```shell
timedatectl list-timezones
```
