# Gnome desktop environment

## Install Gnome and graphical apps packages
```sh
paru -S baobab eog evince file-roller gdm gedit gnome-calculator gnome-characters gnome-control-center gnome-disk-utility gnome-font-viewer gnome-logs gnome-screenshot flameshot gnome-session gnome-settings-daemon gnome-shell gnome-shell-extensions gnome-system-monitor gvfs gvfs-google gvfs-smb mutter nautilus sushi dconf-editor
```

## Gdm configuration
```sh
sudo vim /etc/gdm/custom.conf # (1)
sudo systemctl enable gdm.service
```

1. Uncomment the line `WaylandEnable=false`.

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