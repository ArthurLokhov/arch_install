# Настройка Arch после установки

## Подключаемся к Wi-Fi

```
ping -c 3 www.google.com # (1)
nmcli dev wifi connect <SSID> password “<password>” # (2)
ping -c 3 www.google.com # (1)
```

1. Проверяем есть ли подключение к интернету.
2. Используем данную команду если надо подключиться к интернету с именем`<SSID>` и паролем`<password>`.

## Activate TRIM for SSDs

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

## Настройка neofetch

```
curl -L 'https://raw.githubusercontent.com/ArthurLokhov/arch_install/master/configs/.config/neofetch/neofetch.conf' > ~/.config/neofetch/neofetch.conf # (1)
```

1. Установите мой конфиг - neofetch.conf.
