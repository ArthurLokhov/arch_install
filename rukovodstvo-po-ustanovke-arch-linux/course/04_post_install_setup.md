# 🔧 Настройка Arch после установки

## Подключаемся к Wi-Fi

```
nmcli dev wifi connect <SSID> password “<password>” # (1)
ping -c 3 www.google.com # (2)
```

1. Используем данную команду если надо подключиться к интернету с именем`<SSID>` и паролем`<password>`.&#x20;
2. Проверяем есть ли подключение к интернету.

## Активируйте TRIM для SSD

```
sudo systemctl enable fstrim.timer
```

## Конфигурация git

```
git config --global user.email "<email>" # (1)
git config --global user.name "<name>" # (2)
```

1. Укажите свой email вместо`<email>`.
2. Укажите свое имя пользователя вместо `<name>`.

## Установка Paru

```
cd ~
cd ~/Downloads
git clone https://aur.archlinux.org/paru.git
cd paru
less PKGBUILD # (1)
makepkg -si
sudo vim /etc/paru.conf ->
    # (2)
sudo vim /etc/pacman.conf ->
    # (3)
```

1. Убедитесь, что все в порядке.
2. Раскомментируйте строчки с CombinedUpgrade, UpgradeMenu, NewsOnUpgrade. Добавьте ниже SkipReview.
3. Раскомментируйте строчку с Color.

## Bluetooth

```
paru -S bluez bluez-utils pipewire pipewire-pulse # (1)
mkdir -p ~/.config/pipewire/media-session.d/
cp /usr/share/pipewire/*.conf ~/.config/pipewire/ # (2)
vim ~/.config/pipewire/pipewire.conf # (3)

systemctl --user enable pipewire.service
systemctl --user enable pipewire-pulse.service
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
```

1. Установите нужные для работы Bluetooth  библиотеки.
2. Скопируйте стандартный конфиг.
3. Модифицируйте строку в конфиге `default.clock.allowed-rates = [ 44100 48000 ]`

## Настройка зеркал

```
sudo vim /etc/pacman.conf # (1)
paru -Sy
paru -S reflector rsync curl
sudo reflector --verbose --country 'Germany' -l 25 --sort rate --save /etc/pacman.d/mirrorlist
sudo vim /etc/pacman.d/mirrorlist # (2)
paru -Suy
paru -S ccache grub-customizer
```

1. Раскомментируйте блок `[multilib]`.

Добавьте yandex зеркала.

```
#Server = http://mirror.yandex.ru/archlinux/$repo/os/$arch
#Server = https://mirror.yandex.ru/archlinux/$repo/os/$arch
```

## Настройка звуковой карты

```
paru -S pipewire lib32-pipewire pipewire-alsa pipewire-pulse pipewire-jack lib32-pipewire-jack wireplumber pavucontrol alsa-utils 
```

## Установка шрифтов Windows

```
sudo mkdir /mnt/win1011
sudo ntfs-3g <your_windows_partition> /mnt/win1011
mkdir -p ~/Downloads/WindowsFonts
cp /mnt/win1011/Windows/Fonts/*.tt* ~/Downloads/WindowsFonts
cp /mnt/win1011/Windows/System32/Licenses/neutral/_Default/Core/license.rtf ~/Downloads/WindowsFonts
sudo mkdir /usr/share/fonts/WindowsFonts/
sudo cp ~/Downloads/WindowsFonts/* /usr/share/fonts/WindowsFonts/
sudo chmod 644 /usr/share/fonts/WindowsFonts/*
fc-cache --force
```

## Установка дополнительных шрифтов

```
paru -S ttf-dejavu noto-fonts
paru -S nerd-fonts-jetbrains-mono
```

## Установка моего софта

```
paru -S kitty visual-studio-code-bin discord telegram-desktop firefox
```

## Установка кастомного ядра Xanmod

### ВНИМАНИЕ!!!

Данная процедура длится в районе 3-х часов, так как на arch linux данное ядро не скачивается сразу скомпилированным, а компилируется с нуля.

```
paru -S linux-xanmod linux-xanmod-headers
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo reboot
```

## Удаление остаточных файлов, мусора

```
paru -Syy
paru -Scc
paru -Suu
```
