# Base Arch installation

## Change terminal font:
```sh
setfont ter-132n # (1)
```
1. Set font with naming `ter-132n`.

## Change keyboard layout
```sh
ls /usr/share/kbd/keymaps/i386/qwerty/ # (1)
loadkeys /usr/share/kbd/keymaps/i386/qwerty/ru.map.gz # (2) 
```
1. Print the list of keyboard layouts.
2. Load the keyboard layout. I choose `QWERTY` with russian letters support.

## Set font with russian support
`Coming Soon...`

## Verify the boot mode
```sh
ls /sys/firmware/efi/efivars # (1)
```
1. If the command shows the directory without error, then the system is booted in `UEFI` mode. 

## Connect to the Wi-Fi
```sh
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

1. Ensure your network interface is listed and enabled.
2. Wi-Fi—authenticate to the wireless network using iwctl.
3. Connect to the Wi-Fi.
4. Check the connection to Ethernet.

## Update time and date:
```sh
timedatectl status  # (1)
timedatectl list-timezones # (2)
timedatectl set-timezone <timezone> # (3)
timedatectl status
clear
```

1. Use to ensure the system clock is accurate.
2. Use to get list of timezones.
3. Use to setup the choose timezone.

## Creating a partitions

`WARNING`: `SDA` is my main disk, if you select other one, that disk's name will be different of `SDA`.

Disk Info:
```sh
lsblk # (1)
hdparm -i /dev/sda # (2)
fdisk -l # (3)
cfdisk /dev/sda #   
```

1. Print the list of disks and partitions.
2. Check the disk name in field 'Model'.
3. More information then the first command.
4. Choose the disk, which you will be creating a partitions. I am use `cfdisk`, but you can use the `fdisk`.

### Main partitions:
1. root(`10+Gb`)(`100Gb` - my choose)
2. home(`10+Gb`)(`140Gb` - my choose)
3. swap(`4+Gb`)(`10Gb` - my choose)

Create a partitions, after write a partitions and exit from cfdisk.

## Formating a partitions
```sh
mkfs.ext4 /dev/sda5 # (1) for root
mkfs.ext4 /dev/sda6 # (1) for home
clear
mkswap /dev/sda7 # (2) for swap
swapon /dev/sda7 # (3) for the 'swap' partition
mount /dev/sda5 /mnt # (4) for the 'root' partition
mkdir /mnt/home # (5)
mount /dev/sda6 /mnt/home # (4) for the 'home' partition
```
1. Formatting the partition with correct format.
2. Formatting the partition with `swap` format.
3. Mount the `swap` partition.
4. Mount the partition with your correct folder.
5. Create the folder for `home` partition.

## Setting up fastest mirrors
```sh
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak # (1)
pacman -Sy # (2) 
pacman -S pacman-contrib # (3)
rankmirrors -n 10 /etc/pacman.d/mirrorlist.bak > /etc/pacman.d/mirrorlist # (4)
```
1. Create the mirrorlist backup.
2. Update package list.
3. Download contribute scripts to pacman.
4. This command select the first 10 fastest mirrors and rewrite mirrorlist with them.

## Install essential packages
```sh
pacstrap /mnt base base-devel linux linux-filmware linux-headers \ # (1)
    sudo nano vim git neofetch which zsh\ # (2)
    dosfstools efibootmgr mtools grub \  # (3)
    dhcpd networkmanager intel-ucode # (4)
ls /mnt 
```
1. We are installing the main dependencies.
2. Must-Have utilities.
3. Utilities, which needed for install and setup boot loader.
4. Drivers. Replace `intel-ucode` to `amd-ucode` if your CPU is `AMD`. 

## Generate the FileSystemTable
```sh
genfstab -U /mnt >> /mnt/etc/fstab # Generate File System Table
```

## Enter the newly installed Arch
```sh
arch-chroot /mnt
```

## Generate locales
```sh
vim /etc/locale.gen ->
    en_US.UTF-8 # (1)
    ru_RU.UTF-8 # (2)
locale-gen
```
1. Uncomment this line.

## Configure locales
```sh
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
1. For UI I use the english letters, but for another I use russian letters.

Or automotive this process:
```sh
cd /etc/
sudo curl -L "https://raw.githubusercontent.com/ArthurLokhov/arch_install/main/configs/locale.conf" -O
```

## Configure keyboard layout
```sh
sudo echo "KEYMAP=ru" >> /etc/vconsole.conf 
```

## Set the timezone
```sh
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
```

## Set a root password
```sh
passwd
```

## Create a non-root user
```sh
useadd -m -g users -G wheel,storage,power -s /bin/zsh <user_name> # (1)
passwf <user_name>
EDITOR=vim visudo ->
    %wheel ALL=(ALL) ALL # (2)
```
1. Create a non-root user with zsh terminal, with permissions of wheel, storage and power. `<user_name>` is your username.
2. Uncomment this line.

## Network configuration
```sh
sudo pacman -S lshw
sudo lshw -C network # (1)
cat /sys/class/net/<network_device>/carrier # (2)
echo 'artlkv' > etc/hostname
sudo vim /etc/hosts -> # (3)
    127.0.0.1   localhost
    ::1         localhost   
    127.0.0.1   artlkv.localdomain localhost
systemctl enable dhcpcd.service
systemctl enable NetworkManager.service
nmcli device wifi connect <SSID> password <password> # (4)
```

1. Gives you the network interface name and the driver name.
2. Verify which network device is plugged.
3. Set hostname.
4. If you need connect to Wi-Fi with name `<SSID>` and password `<password>`.

## Next...
Chapter 3: [`Install Grub boot loader`](./grub_boot_loader.md).