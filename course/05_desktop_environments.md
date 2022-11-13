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

## Activate Bluetooth service

```
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service
```

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

## Install Windows fonts

```
sudo mkdir /mnt/win1011
sudo ntfs-3g <your_windows_partition> /mnt/win1011
mkdir -p ~/Downloads/WindowsFonts
cp /mnt/win1011/Windows/Fonts/*.tt* ~/Downloads/WindowsFonts
cp /mnt/win1011/Windows/System32/Licenses/neutral/_Default/Core/license.rtf ~/Downloads/WindowsFonts
sudo mkdir /usr/share/fonts/WindowsFonts/
sudo cp ~/Downloads/WindowsFonts/* /usr/share/fonts/WindowsFonts/
sudo chmod 644 /usr/share/fonts/WindowsFonts/*
fc-cache --force
```

## Install other fonts

```
paru -S ttf-dejavu noto-fonts
paru -S nerd-fonts-jetbrains-mono
paru -S nerd-fonts-fira-code
```

## Install kitty

```
paru -S kitty
paru -R xterm # (1)
mkdir -p ~/.config/kitty
curl -L 'https://raw.githubusercontent.com/ArthurLokhov/arch_install/master/configs/.config/kitty/kitty.conf' > ~/.config/kitty/kitty.conf # (2)
```

1. Unless you use raw X.org, you probably won’t need this. :)
2. Install my kitty.conf.

##
