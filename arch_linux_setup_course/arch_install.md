# Base Arch installation

## Change Terminal Font:
*****
```sh
setfont ter-132n # (1)
```
1. Set font with naming `ter-132n` 

## Change Keyboard Layout
*****
```sh
ls /usr/share/kbd/keymaps/i386/qwerty/ # (1)
loadkeys /usr/share/kbd/keymaps/i386/qwerty/ru.map.gz # (2) 
```
1. Print the list of keyboard layouts
2. Load the keyboard layout. I choose `QWERTY` with russian letters support.

## Set font with russian support
*****
`Coming Soon...`

## Verify the boot mode
*****
```sh
ls /sys/firmware/efi/efivars # (1)
```
1. If the command shows the directory without error, then the system is booted in `UEFI` mode. 

## Connect to the Wi-Fi
*****
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

1. Ensure your network interface is listed and enabled
2. Wi-Fi—authenticate to the wireless network using iwctl.
3. Connect to the Wi-Fi
4. Check the connection to Ethernet

## Update Time and Date:
*****
```sh
timedatectl status  # (1)
timedatectl list-timezones # (2)
timedatectl set-timezone <timezone> # (3)
timedatectl status
clear
```

1. Use to ensure the system clock is accurate
2. Use to get list of timezones
3. Use to setup the choose timezone

## Creating a Partitions
*****

`WARNING`: `SDA` is my main disk, if you select other one, that disk's name will be different of `SDA`

Disk Info:
```sh
lsblk # (1)
hdparm -i /dev/sda # (2)
fdisk -l # (3)
cfdisk /dev/sda #   
```

1. Print the list of disks and partitions
2. Check the disk name in field 'Model'
3. More information then the first command
4. Choose the disk, which you will be creating a partitions. I am use `cfdisk`, but you can use the `fdisk`.

### Main partitions:
1. root(`10+Gb`)(`100Gb` - my choose)
2. home(`10+Gb`)(`140Gb` - my choose)
3. swap(`4+Gb`)(`10Gb` - my choose)

Create a partitions, after write a partitions and exit from cfdisk

## Formating a partitions
*****
```sh
mkfs.ext4 /dev/sda5 # (1) for root
mkfs.ext4 /dev/sda6 # (1) for home
clear
mkswap /dev/sda7 # (2) for swap
swapon /dev/sda7 # (3) for the 'swap' partition
mount /dev/sda5 /mnt # (3) for the 'root' partition
mkdir /mnt/home # (4) create 'home' holder
mount /dev/sda6 /mnt/home # (3) for the 'home' partition
```
1. Formatting the partition with correct format.

## Coming Soon....
*****