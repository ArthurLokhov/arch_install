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

## Coming Soon....
*****