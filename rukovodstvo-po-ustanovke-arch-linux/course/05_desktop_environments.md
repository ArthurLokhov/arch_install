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

## Установка используемых мною программ

```
paru -S google-chrome mpv discord telegram-desktop visual-studio-code-bin ark
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

## Удаление лишних программ

```
paru -R discover plasma-sdk
```

## Настройка внешнего вида

1. Устанавливаем Sweet KDE тему. Также устанавливаем Sweet тему для GTK/Gnome приложений.
2. Заходим в Window Decoration>Titlebar Buttons. Убираем все иконки и переносим свернуть, на весь экран, закрыть в левый угол.
3. Меняем шрифт на JetbrainsMono Nerd Font, Regular, 11.
4. Устанавливаем пак иконок BeautyLine.
5. Переходим в Startup and Shutdown и ставим для экрана блокировки тему Sweet.

## Настройка эффектов

1. Переходим в Windows Behavior>Desktop Effects. Включаем Wobbly Windows, но уберите галочку срабатывания данного эффекта, когда окно масштабируется.
2. Также включаем Magic Lamp и ставим в настройках 300 миллисекунд.&#x20;

## Установка Kvantum Engine

```
paru -S kvantum-qt5
```

1. Установите Sweet тему для  kvantum-qt5, а затем активируйте ее в самой программе.
2. Перейдите в Application Style и установите kvantum-dark.

