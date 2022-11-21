---
description: Операционная система внутри операционной системы
---

# Виртуализация

## VirtualBox

Для виртуализации я буду использовать _**VirtualBox**_.

{% hint style="info" %}
_**VirtualBox**_ — гипервизор, предназначенный для запуска операционных систем в специальной среде, называемой виртуальной машиной, поверх существующей операционной системы.&#x20;
{% endhint %}

В самом начале установим сам _**VirtualBox**_.

```shell
paru -S virtualbox
```

Теперь надо установить необходимые хост-модули.

* _**virtualbox-host-modules-arch**_ - если стоит ядро linux.
* _**virtualbox-host-dkms**_ -  если стоит кастомное ядро, включая linux-lts.

```shell
paru -S virtualbox-host-modules-arch
```

Далее нам нужно запустить сервис, отвечающий за подгрузку этих модулей. Для этого достаточно перезагрузиться.

```shell
sudo reboot
```

## Модули

Если какие-то модули не загрузились, то их можно загрузить вручную. Показано на примере модуля _**vboxdrv**_.

```shell
modprobe vboxdrv
```

Если модули были загружены, но получили позже обновление, то их необходимо перезагрузить.

```shell
sudo vboxreload
```

## Дополнительные настройки

Можно поставить дополнительные функции для _**VirtualBox**_, но огнни распростроняются под несвободной лицензией.

```shell
paru -S virtualbox-ext-oracle
```

Также если мы хотим подключить к виртуальной машине другую гостевую машину отличную от Arch Linux, то надо поставить следующий пакет.

```shell
paru -S virtualbox-guest-iso
```

Ниже приведены команды, которые нужно выполнить если у вас Gnome на Wayland.

```shell
gsettings get org.gnome.mutter.wayland xwayland-grab-access-rules
gsettings set org.gnome.mutter.wayland xwayland-grab-access-rules "['VirtualBox Machine']"
```



