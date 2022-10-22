# Gnome desktop environment

## Install Gnome and graphical apps packages
```sh
paru -S baobab eog evince file-roller gdm gedit gnome-calculator gnome-characters gnome-control-center gnome-disk-utility gnome-font-viewer gnome-logs gnome-screenshot flameshot gnome-session gnome-settings-daemon gnome-shell gnome-shell-extensions gnome-system-monitor gnome-tweaks gnome-menus gvfs gvfs-google gvfs-smb mutter nautilus sushi dconf-editor google-chrome
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

## Install GNOME extensions
```sh
paru -S gnome-browser-connector
```

Go to [`Gnome extensions`](https://extensions.gnome.org/) and install the Chrome extension.
Browse the catalog and install :
- ArcMenu
- Dash to Panel
- No overview at start-up
- Tray Icons: Reloaded

## Configure GNOME extensions
1. ArcMenu
- Display ArcMenu on : Dash to Panel

2. Dash to Panel
- Panel screen position: On top

## Configure font antialiasing and other
1. Launch Tweaks app.
2. Fonts > Antialiasing > Subpixel.
3. Download and setup the wallpaper.