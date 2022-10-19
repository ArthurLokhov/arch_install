# Arch Linux

## Download `Arch Linux` with `Dualboot`
1. Download [Torrent file](https://archlinux.org/releng/releases/)
2. Install .iso with Rufus(With `GPT`):

<img src="./assets/rufus.png" alt="rufus install" />

3. Reboot `Windows` and open `Boot Menu`.

****
## `Configure Arch Linux`

### Configure `Wi-Fi`:

use `iwctl`:
```sh
help
device list
station <wlan> scan
station <wlan> get-networks
exit
```
Connect to Wi-Fi:

iwctl --passphrase `password` station `wlan` connect  `SSID`

And check connection:
```sh
ping archlinux.org -c 5
```

### Base Configure

Change Terminal Font:
```sh
clear
setfont ter-132n
```

Verify EFI Boot:
```sh
ls /sys/firmware/efi/efivars/
```

Update Time and Date:
```sh
timedatectl status
timedatectl list-timezones
timedatectl set-timezone <timezone>
timedatectl status
clear
```

Load Keyboard Layout:
```sh
ls /usr/share/kbd/keymaps/i386/qwerty/ # print the list of keyboard layouts
loadkeys /usr/share/kbd/keymaps/i386/qwerty/[ru/us].map.gz # load the keyboard layout 
```

### Creating a Partitions
`WARNING`: `SDA` is my main disk, if you select other one, that disk's name will be different of `SDA`

Disk Info:
```sh
lsblk # print the list of disks and partitions 
hdparm -i /dev/sda # check the disk name in field 'Model'
fdisk -l # more information
cfdisk /dev/sda # choose the disk, which you will be creating a partitions  
```

Main partitions:
1. root(`10+Gb`)(`100Gb` - my choose)
2. home(`10+Gb`)(`140Gb` - my choose)
3. swap(`4+Gb`)(`10Gb` - my choose)

Create a partitions, after write a partitions and exit from cfdisk

### Formating a partitions
```sh
mkfs.ext4 /dev/sda5 # aka root
mkfs.ext4 /dev/sda6 # aka home
clear
mkswap /dev/sda7 # aka swap
swapon /dev/sda7 # mount the 'swap' partition
lsblk # check is info corrent or not

mount /dev/sda5 /mnt # mount the 'root' partition
mkdir /mnt/home # create 'home' holder
mount /dev/sda6 /mnt/home # mount the 'home' partition
lsblk # check is info corrent or not
```

### Setting up fastest mirrors
```sh
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak # create the mirrorlist backup
ls /etc/pacman.d/ # check is backup create or not
pacman -Sy # update package list
pacman -S pacman-contrib # download contribute scripts to pacman(rankmirrors command is the part of that)
rankmirrors -n 10 /etc/pacman.d/mirrorlist.bak > /etc/pacman.d/mirrorlist # this command select the first 10 fastest mirrors and rewrite mirrorlist with them
cat /etc/pacman.d/mirrorlist # check is info corrent or not
```
****
## `Install Arch`

### Install `Linux Kernel` and other 
```sh
pacstrap /mnt base base-devel linux linux-lts linux-headers linux-firmware intel-ucode sudo nano vim git neofetch networkmanager dhcpcd pulseaudio bluez wpa_supplicant

ls /mnt # check is installed correct or not
```

### Generate `FSTAB`
```sh
genfstab -U /mnt >> /mnt/etc/fstab # Generate File System Table
cat /mnt/etc/fstab # check is info corrent or not
```
****
## Also another one configuration

### Change `default` Arch root to `ours`.
```sh
arch-chroot /mnt
lsblk
```
### Set the Root Password
```sh
passwd
```

### Create a standard user
```sh
useradd -m 'user' # add the new user
passwd 'user' # add the password to the new user
usermod -aG wheel,storage,power 'user' # add the priviligue to the new user
EDITOR=nano visudo ->
    %wheel ALL=(ALL) ALL # Uncomment this line
    Defaults timestamp_timeout=0 # Add this line
    # Press Ctrl+X
```

### Setting a system language
```sh
nano /etc/locale.gen ->
    en_US.UTF-8 # Uncomment this line
    ru_RU.UTF-8 # Uncomment this line
    # Press Ctrl+X
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
```

### Setup hostname and update hosts
```sh
echo 'DevArtLkvArchLinux' > /etc/hostname # replace 'DevArtLkvArchLinux' to yours.
cat /etc/hostname
nano /etc/hosts ->
    127.0.0.1   localhost # Add this line
    ::1   localhost # Add this line
    127.0.0.1   'DevArtLkvArchLinux'.localdomain localhost  # Add this line
    # Press Ctrl+X
```

### Setting up timezone/region
```sh
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
```
****
## `Install Grub Boot Loader`

### Create the 'efi' partition
```sh
lsblk
mkdir /boot/efi # create the 'efi' partition
mount /dev/sda1 /boot/efi/ # mount the 'efi' partition
lsblk # check is info corrent or not
```
### Create the grub loader
```sh
pacman -S grub efibootmgr dosfstools mtools #
nano /etc/default/grub ->
    GRUB_DISABLE_OS_PROBER=false # Uncomment this line
    # Press Ctrl+X
pacman -S os-prober hwinfo ntfs-3g 
grub-install --target=<x86_64>-efi --bootloader-id=grub_uefi --recheck # <x86_64> is your computure arch
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable dhcpcd.service
systemctl enable NetworkManager.service
exit
umount -lR /mnt
```

If Windows don't open, do next:
```sh
reboot
grub-mkconfig -o /boot/grub/grub.cfg
reboot
```


****
## `Install Nvidia`
```sh
lspci -k | grep -A 2 -E "( VGA | 3D )" # Find VGA name
```
****
## `Delete Arch Linux`
1. Delete the Arch partitions in Windows Disk Management
2. Use diskpart to delete grub_efi folder on EFI partition. 