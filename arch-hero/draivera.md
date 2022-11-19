---
description: Ох, Железки мои, Железки любимые.
---

# 🔌 Драйвера

## Bluetooth и звуковая карта

```
paru -S bluez bluez-utils
paru -S pipewire lib32-pipewire pipewire-alsa pipewire-pulse pipewire-jack lib32-pipewire-jack wireplumber pavucontrol alsa-utils # (1) 
mkdir -p ~/.config/pipewire/media-session.d/
cp /usr/share/pipewire/*.conf ~/.config/pipewire/
vim ~/.config/pipewire/pipewire.conf

systemctl --user enable pipewire.service
systemctl --user enable pipewire-pulse.service
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
```

## Клавиатура

```
sudo vim /etc/X11/xorg.conf.d/00-keyboard.conf # (1)
    Section "InputClass"
            Identifier "system-keyboard"
            MatchIsKeyboard "on"
            Option "XkbLayout" "us,ru"
            Option "XkbModel" "pc105"
            Option "XkbOptions" "grp:alt_shift_toggle"
    EndSection
```

1. Создаем файл 00-keyboard.conf с описанием того, как должна себя вести клавиатура.

## TP-LINK: Wireless USB Adapter

Если помните, то я говорил, что внешний Wi-Fi модуль от компании TP-LINK не работает без драйверов. Но их драйвер не работает на Linux, но я нашел решение проблемы. Собственно вот оно.

```shell
git clone https://aur.archlinux.org/rtl88xxau-aircrack-dkms-git.git
cd tl88xxau-aircrack-dkms-git
makepkg -s
paru -U  rtl88xxau-aircrack-dkms-git-r1211.e7a4a39-1-x86_64.pkg.tar.zst
```
