# 🖥 Оконное окружение

## Установка X сервера

```
paru -S xorg-server xorg-xinit
```

## Установка Qtile

```
paru -S qtile qtile-extras-git gdm rofi python-dbus-next network-manager-applet pasystray blueman bottom picom-git catppuccin-gtk-theme-mocha
```

## Настройка Gdm

```
sudo vim /etc/gdm/custom.conf # (1)
sudo systemctl enable gdm.service
```

1. Раскомментируйте `WaylandEnable=false`.

## Установка полезного софта

```
paru -S nautilus baobab eog evince file-roller flameshot htop firefox dunst visual-studio-code-bin discord signal-desktop  
```

## Установка приложений от Gnome

```
paru -S gnome-tweaks gnome-settings-daemon gnome-characters gnome-calculator gnome-disk-utility gnome-font-viewer gnome-logs gnome-keyring
```

## Активация numlockx во время старта системы

```
paru -S numlockx
vim ~/.xprofile ->
    if [ -x /usr/bin/numlockx ]; then
            /usr/bin/numlockx on
    fi
```

## Перезагрузка

```
sudo reboot
```

##
