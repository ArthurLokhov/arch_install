# Предварительная настройка

## Настройка Windows

1. Отключите функцию`Fast boot` в вашем bios. &#x20;
2. Установите локальное время как универсальное. Для этого:

* Откройте`REGEDIT` и найдите `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\TimeZoneInformation\`.
* Создайте`QWORD` с именем`RealTimeIsUniversal` и значением`1`.
* Откройте настройки даты и времени и отключите функции`Set time automatically` и`Set timezone automatically`.
* Затем заново включите их.

## Установка образа Arch Linux

1. Скачайте нужный вам торрент файл по этой ссылке - [Torrent file](https://archlinux.org/releng/releases/).
2. Установите .iso образ, обязательно включите GPT:

![rufus install](../assets/rufus.png)

Перезапустите Windows и запустите установочную флешку с Arch Linux через Boot Menu.
