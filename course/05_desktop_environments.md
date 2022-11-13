# Оконное окружение

## X.org install

```
paru -S xorg-server xorg-xinit xterm
```

## Install Gnome DE and graphical apps packages

```
paru -S baobab eog evince file-roller gdm gedit gnome-calculator gnome-characters gnome-control-center gnome-disk-utility gnome-font-viewer gnome-logs gnome-screenshot flameshot gnome-session gnome-settings-daemon gnome-shell gnome-shell-extensions gnome-system-monitor gnome-tweaks gnome-menus gvfs gvfs-google gvfs-smb mutter nautilus sushi dconf-editor google-chrome
```

## Gdm configuration

```
sudo vim /etc/gdm/custom.conf # (1)
sudo systemctl enable gdm.service
```

1. Uncomment the line `WaylandEnable=false`.

## Activate numlock on startup

```
paru -S numlockx
vim ~/.xprofile ->
    if [ -x /usr/bin/numlockx ]; then
            /usr/bin/numlockx on
    fi
```

## Reboot

```
sudo reboot
```

## Install GNOME extensions

```
paru -S gnome-browser-connector
```

## Configure font antialiasing and other

1. Launch Tweaks app.
2. Fonts > Antialiasing > Subpixel.
3. Download and setup the wallpaper.

##
