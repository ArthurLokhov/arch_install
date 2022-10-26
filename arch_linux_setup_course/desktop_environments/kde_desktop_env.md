# KDE desktop environment


## Install Plasma and graphical apps packages
```sh
paru -S plasma-desktop sddm dolphin firefox
```

## Plasma and Sddm configuration
```sh
sudo systemctl enable sddm.service
sudo systemctl stop dhcpcd.service
sudo systemctl disable dhcpcd.service
```

## Activate Bluetooth service
```sh
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service
```

## Activate numlock on startup
```sh
paru -S numlockx
vim ~/.xprofile ->
    if [ -x /usr/bin/numlockx ]; then
            /usr/bin/numlockx on
    fi
```

## Reboot
```sh
sudo reboot
```

## Post reboot
```sh
sudo paru -Syyu
```