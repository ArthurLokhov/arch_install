# ⚙ Базовая установка Arch Linux

## Меняем шрифт на более удобный:

```
setfont ter-132n
```

1. Крайне советую ставить особенно тем, у кого 4к монитор. Изначально шрифт не такой четкий и читабельный.

## Устанавливаем в качестве раскладки qwerty с поддержкой русского языка

```
ls /usr/share/kbd/keymaps/i386/qwerty/ # (1)
loadkeys /usr/share/kbd/keymaps/i386/qwerty/ru.map.gz # (2) 
```

1. Выводит список всех возможных раскладок типа qwerty.
2. Устанавливаем  нашу раскладку. Я выбрал раскладку с поддержкой русского языка.

## Проверяем правильность установки EFI:

```
ls /sys/firmware/efi/efivars # (1)
```

1. Если ошибок нет, то мы запустились с поддержкой UEFI.

## Подключаемся к Wi-Fi

```
ip link # (1)
iwctl # (2)
help
device list
station <wlan> scan
station <wlan> get-networks
exit
iwctl --passphrase `password` station `wlan` connect  `SSID`  # (3)
ping archlinux.org -c 5  # (4)
```

1. Убедимся в том, что наше интернет устройство включено.
2. Для подключение к Wi-Fi используем утилиту iwctl.
3. Подключаемся к Wi-Fi. Указываем пароль, наше устройство и наименование сети.
4. Проверяем подключение к интернету.

## Настраиваем дату и время:

```
timedatectl status  # (1)
timedatectl list-timezones # (2)
timedatectl set-timezone <timezone> # (3)
timedatectl status
clear
```

1. Проверяем изначально установленное время.
2. Выводим список доступных временных зон.
3. Устанавливаем выбранную временную зону.

## Создаем разделы под линукс

`ВНИМАНИЕ`: `nvme0n1` это мой диск, у вас он может называться по  другому.

```
lsblk # (1)
hdparm -i /dev/nvme0n1 # (2)
fdisk -l # (3)
cfdisk /dev/nvme0n1 #   
```

1. Выводит информацию о существующих разделах диска.
2. Название диска можно проверить в  поле 'Model'.
3. Работает как lsblk, но выводит больше информации.
4. Выбираем диск, на котором будем делать разделы. Для создания разделом я использую`cfdisk`, но ты можешь использовать`fdisk`.

### Важные разделы:

1. root(`10+Gb`)(200Gb- мой выбор)
2. home(`10+Gb`)(200Gb - мой выбор)
3. swap(`4+Gb`)(10Gb - мой выбор)

Создаем разделы, затем записываем их и выходим из программы.

## Форматируем разделы

```
mkfs.ext4 /dev/nvme0n1p5 # (1) for root
mkfs.ext4 /dev/nvme0n1p6 # (1) for home
clear
mkswap /dev/nvme0n1p7 # (2) for swap
swapon /dev/nvme0n1p7 # (3) for the 'swap' partition
mount /dev/nvme0n1p5 /mnt # (4) for the 'root' partition
mkdir /mnt/home # (5)
mount /dev/nvme0n1p6 /mnt/home # (4) for the 'home' partition
```

1. Форматируем разделы в нужный нам формат  ext4.
2. Форматируем раздел в swap формат.
3. Монтируем в систему swap раздел.
4. Монтируем разделы в указанные папки.
5. Создаем папку для папки пользователя.

## Создаем EFI раздел

```
mkdir /mnt/efi # (1)
mount /dev/nvme0n1p1 /mnt/efi/ # (2)
```

1. Создает EFI раздел.
2. Монтируем в папку тот раздел, на котором установлен Windows Boot Loader.

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
