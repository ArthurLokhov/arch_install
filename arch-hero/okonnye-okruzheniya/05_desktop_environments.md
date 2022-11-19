---
description: Подходит для тех, кто любит все кастомизировать под себя
---

# 1⃣ KDE

## Установка основных пакетов

```
paru -S plasma sddm 
paru -S kitty dolphin
sudo systemctl enable sddm
sudo systemctl start sddm
```

## Установка используемых мною программ

```
paru -S google-chrome flameshot mpv discord telegram-desktop visual-studio-code-bin ark obs-studio
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
6. Устанавливаем свои обои на рабочий стол.

## Настройка эффектов

1. Переходим в Windows Behavior>Desktop Effects. Включаем Wobbly Windows, но уберите галочку срабатывания данного эффекта, когда окно масштабируется.
2. Также включаем Magic Lamp и ставим в настройках 300 миллисекунд.&#x20;

## Установка Kvantum Engine

```
paru -S kvantum-qt5
```

1. Установите Sweet тему для  kvantum-qt5, а затем активируйте ее в самой программе.
2. Перейдите в Application Style и установите kvantum-dark.

## Установим Latte Dock

```
paru -S kdecoration plasma5-applets-window-buttons latte-dock
```

1. Скачиваем новые виджеты window buttons applet, window title.
2. Запускаем Latte Dock и настраиваем его под себя. Откючаем панель от kde plasma.
3. Добавляем в Application Launcher виджет Global Menu.&#x20;

## Устанавливаем Kwin скрипты

1. Первый скрипт, который надо установить называется Hide Title.

