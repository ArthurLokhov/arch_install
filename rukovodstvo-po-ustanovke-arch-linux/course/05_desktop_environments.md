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

## Настройка Picom

```
curl -L "https://raw.githubusercontent.com/ArthurLokhov/arch_install/main/configs/.config/picom/picom.conf" >> ~/.config/picom/picom.conf
```

## Настройка Flameshot

```
curl -L "https://raw.githubusercontent.com/ArthurLokhov/arch_install/main/configs/.config/flameshot/flameshot.ini" >> ~/.config/flameshot/flameshot.ini
```

## Настройка Rofi

```
curl -L "https://raw.githubusercontent.com/ArthurLokhov/arch_install/main/configs/.config/rofi/config.rasi" >> ~/.config/rofi/config.rasi
```

## Настройка Dunst

```
curl -L "https://raw.githubusercontent.com/ArthurLokhov/arch_install/main/configs/.config/dunst/dunstrc" >> ~/.config/dunst/dunstrc
```

## Настройка Qtile

```
curl -L "https://raw.githubusercontent.com/ArthurLokhov/arch_install/main/configs/.config/qtile/config.py" >> ~/.config/qtile/config.py
curl -L "https://raw.githubusercontent.com/ArthurLokhov/arch_install/main/configs/.config/qtile/owm.py" >> ~/.config/qtile/owm.py
curl -L "https://raw.githubusercontent.com/ArthurLokhov/arch_install/main/configs/.config/qtile/autostart.sh" >> ~/.config/qtile/autostart.sh
```

## Перезагрузка

```
sudo reboot
```

##
