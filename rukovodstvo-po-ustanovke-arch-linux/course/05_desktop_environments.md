# 🖥 Оконное окружение(KDE)

## Установка X11(Если у вас не Nvidia берите Wayland)

```
sudo pacman -Syuu
paru -S xorg-server xorg-xinit
```

## Установка основы для дальнейшей модификации

```
paru -S plasma sddm
paru -S kitty dolphin
sudo systemctl enable sddm
sudo systemctl start sddm
```

## Удаление лишних плагинов и программ из KDE Plasma

```
paru -R layer-shell-qt kwayland-integration plasma-sdk kwallet-pam
```

## Установка используемых мною программ

```
paru -S google-chrome mpv discord telegram-desktop visual-studio-code-bin
```

## Настройка Bluetooth и звуковой карты

```
paru -S bluez bluez-utils # (1)
paru -S pipewire lib32-pipewire pipewire-alsa pipewire-pulse pipewire-jack lib32-pipewire-jack wireplumber pavucontrol alsa-utils # (1) 
mkdir -p ~/.config/pipewire/media-session.d/
cp /usr/share/pipewire/*.conf ~/.config/pipewire/ # (2)
vim ~/.config/pipewire/pipewire.conf # (3)

systemctl --user enable pipewire.service
systemctl --user enable pipewire-pulse.service
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
```

1. Установите нужные для работы Bluetooth и звуковой карты  библиотеки.
2. Скопируйте стандартный конфиг.
3. Модифицируйте строку в конфиге `default.clock.allowed-rates = [ 44100 48000 ]`

После установки требуется зайти в Настройки>Внешний вид>Стиль приложения>GNOME/GTK и настроить внешний вид GTK приложений.
