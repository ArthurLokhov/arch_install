# ⚙ Базовая установка Arch Linux

## Устанавливаем в качестве раскладки qwerty с поддержкой русского языка

```
ls /usr/share/kbd/keymaps/i386/qwerty/ # (1)
loadkeys /usr/share/kbd/keymaps/i386/qwerty/ru.map.gz# (2) 
```

1. Выводит список всех возможных раскладок типа qwerty.
2. Устанавливаем  нашу раскладку. Я выбрал раскладку с поддержкой русского языка.

## Устанавливаем самые быстрые зеркала(позже reflector)

```
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak # (1)
pacman -Sy # (2) 
pacman -S pacman-contrib # (3)
rankmirrors -n 10 /etc/pacman.d/mirrorlist.bak > /etc/pacman.d/mirrorlist # (4)
```

1. Создаем backup файла mirrorlist.
2. Обновляем список доступных пакетов.
3. Устанавливаем вспомогательные скрипты для pacman.
4. Эта команда установит 10 самых быстрых зеркал и запишет их в файл mirrorlist.

## Установка ядра linux

```
pacstrap /mnt base base-devel linux linux-filmware \ # (1)
    sudo vim git neofetch which zsh \ # (2)
    networkmanager intel-ucode # (3)
ls /mnt 
```

1. Устанавливаем основные  зависимости.
2. Must-Have утилиты.
3. Драйвера. Замените`intel-ucode` на `amd-ucode`, если вы используете AMD.

## Генерируем File System Table

```
genfstab -U /mnt >> /mnt/etc/fstab # Generate File System Table
```

## Заходим в установленную систему

```
arch-chroot /mnt
```

## Генерируем локали

```
vim /etc/locale.gen ->
    en_US.UTF-8 # (1)
    ru_RU.UTF-8 # (2)
locale-gen
```

1. Раскомментируйте  указанные строки.

## Настройка локалей

```
vim /etc/locale.conf ->
    LANG=en_US.UTF-8 # (1)
    LC_ADDRESS=ru_RU.UTF-8
    LC_COLLATE=C
    LC_CTYPE=ru_RU.UTF-8
    LC_IDENTIFICATION=ru_RU.UTF-8
    LC_MONETARY=ru_RU.UTF-8
    LC_MESSAGES=en_US.UTF-8 # (1)
    LC_MEASUREMENT=ru_RU.UTF-8
    LC_NAME=ru_RU.UTF-8
    LC_NUMERIC=ru_RU.UTF-8
    LC_PAPER=ru_RU.UTF-8
    LC_TELEPHONE=ru_RU.UTF-8
    LC_TIME=ru_RU.UTF-8
```

1. Интерфейс будет на английском, а все остальное на русском.

## Настройка клавиатуры

```
sudo echo "KEYMAP=ru" >> /etc/vconsole.conf 
```

## Устанавливаем временную зону

```
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
```

## Меняем пароль root пользователя

```
passwd
```

## Создаем пользователя без привилегий

```
useadd -m -g users -G wheel,storage,power -s /bin/zsh <user_name> # (1)
passwd <user_name>
EDITOR=vim visudo ->
    %wheel ALL=(ALL) ALL # (2)
```

1. Создаем пользователя без привилегий с zsh терминалом, с разрешениями к устройству, хранилищу и энергии. Вместо `<user_name>` вставьте свое имя.
2. Раскомментируйте  указанную строку.

## Настройка сети

```
sudo pacman -S lshw
sudo lshw -C network
cat /sys/class/net/<network_device>/carrier # (1)
echo 'artlkv' > etc/hostname
sudo vim /etc/hosts -> # (2)
    127.0.0.1   localhost
    ::1         localhost   
    127.0.0.1   artlkv.localdomain localhost
systemctl enable dhcpcd.service
systemctl enable NetworkManager.service
```

1. Проверяем, что интернет устройство подключено.
2. Устанавливаем hosts.

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
