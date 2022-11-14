# 🖥 Оконное окружение

## Установка X сервера

```
paru -S xorg-server xorg-xinit
```

## Установка Qtile

```
paru -S qtile qtile-extras-git gdm rofi python-dbus-next network-manager-applet pasystray blueman bottom picom-git
```

## Настройка Gdm

```
sudo vim /etc/gdm/custom.conf # (1)
sudo systemctl enable gdm.service
```

1. Раскомментируйте `WaylandEnable=false`.

## Установка полезного софта

```
paru -S baobab eog evince file-roller gnome-characters gnome-calculator gnome-disk-utility gnome-font-viewer gnome-logs flameshot gnome-settings-daemon nautilus
```

## Активация numlockx во время старта системы

```
paru -S numlockx
vim ~/.xprofile ->
    if [ -x /usr/bin/numlockx ]; then
            /usr/bin/numlockx on
    fi
```

## Настройка Picom

```
curl -L "https://raw.githubusercontent.com/ArthurLokhov/arch_install/main/configs/.config/picom/picom.conf" >> ~/.config/picom/picom.conf
```

## Настройка Flameshot

```
curl -L "https://raw.githubusercontent.com/ArthurLokhov/arch_install/main/configs/.config/flameshot/flameshot.ini" >> ~/.config/flameshot/flameshot.ini
```

## Перезагрузка

```
sudo reboot
```

##
