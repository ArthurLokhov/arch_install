---
description: Ох, Железки мои, Железки любимые.
---

# 🔌 Драйвера

{% hint style="success" %}
Советую использовать пакетный помощник _**paru**_. Как его установить было показано в пункте "**Полировка системы**".
{% endhint %}

## Bluetooth и звуковая карта

Установим необходимые пакеты.

```shell
paru -S bluez bluez-utils pipewire lib32-pipewire pipewire-alsa pipewire-pulse pipewire-jack lib32-pipewire-jack wireplumber pavucontrol alsa-utils
```

Скопируем конфиг для _**pipewire**_. &#x20;

```shell
mkdir -p ~/.config/pipewire/media-session.d/
cp /usr/share/pipewire/*.conf ~/.config/pipewire/

```

Далее надо в конфиге подправить строчку "**default.clock.allowed-rates**" и задать значение "**\[ 44100 48000 ]**" вместо "**\[ 48000 ]**".

```shell
vim ~/.config/pipewire/pipewire.conf
```

Теперь мы можем запустить _**pipewire**_ и сам _**Bluetooth**_.

```shell
systemctl --user enable pipewire.service
systemctl --user enable pipewire-pulse.service
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
```

## Клавиатура

Чтобы мы могли менять раскладку с русской на английскую, мы должны создать файл конфитурации для клавиатуры _/etc/X11/xorg.conf.d/00-keyborad.conf._

```shell
sudo vim /etc/X11/xorg.conf.d/00-keyboard.conf
```

И вводим следующие.

```shell
Section "InputClass"
            Identifier "system-keyboard"
            MatchIsKeyboard "on"
            Option "XkbLayout" "us,ru"
            Option "XkbModel" "pc105"
            Option "XkbOptions" "grp:alt_shift_toggle"
EndSection
```

## TP-LINK: Wireless USB Adapter

Если помните, то я говорил, что внешний Wi-Fi модуль от компании TP-LINK не работает без драйверов. Но их драйвер не работает на Linux, но я нашел решение проблемы. Собственно вот оно.

Сначала скачаем нужный пакет.

```shell
git clone https://aur.archlinux.org/rtl88xxau-aircrack-dkms-git.git
cd tl88xxau-aircrack-dkms-git
```

Теперь собирем данный пакет и затем установим его.

```shell
makepkg -s
paru -U rtl88xxau-aircrack-dkms-git-r1211.e7a4a39-1-x86_64.pkg.tar.zst
```
