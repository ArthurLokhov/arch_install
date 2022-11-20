# Установка шрифтов

Установим шрифты, которые будут использоваться в нашей системе, а также шрифт от Jetbrains с поддержкой лигатур и патчем от Nerd Font.

```shell
paru -S ttf-dejavu noto-fonts
paru -S nerd-fonts-jetbrains-mono
```

Если у вас второй операционной системой стоит Windows, то вы можете скачать оттуда Microsoft шрифты.

Сначала создадим раздел и смонтируем туда раздел с Windows. Вместо _**\<your\_windows\_partition>**_ введите раздел с установленной Windows, зачастую это третий раздел.

```shell
sudo mkdir /mnt/windows
sudo ntfs-3g <your_windows_partition> /mnt/windows
```

Теперь скопируем шрифты.

```shell
mkdir -p ~/Downloads/WindowsFonts
cp /mnt/windows/Windows/Fonts/*.tt* ~/Downloads/WindowsFonts
```

И установим шрифты.

```shell
sudo mkdir /usr/share/fonts/WindowsFonts/
sudo cp ~/Downloads/WindowsFonts/* /usr/share/fonts/WindowsFonts/
sudo chmod 644 /usr/share/fonts/WindowsFonts/*
fc-cache --force
```
