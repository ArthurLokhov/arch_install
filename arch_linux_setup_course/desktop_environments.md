# Desktop environment

## X.org install
```sh
paru -S xorg-server xorg-xinit xterm
```

## Install Gnome DE and graphical apps packages
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

## Configure font antialiasing and other
1. Launch Tweaks app.
2. Fonts > Antialiasing > Subpixel.
3. Download and setup the wallpaper.

## Install Windows fonts
```sh
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
```sh
paru -S ttf-dejavu noto-fonts
paru -S nerd-fonts-jetbrains-mono
paru -S nerd-fonts-fira-code
```

## Install kitty
```sh
paru -S kitty
paru -R xterm # (1)
mkdir -p ~/.config/kitty
curl -L 'https://raw.githubusercontent.com/ArthurLokhov/arch_install/master/configs/.config/kitty/kitty.conf' > ~/.config/kitty/kitty.conf # (2)
```

1. Unless you use raw X.org, you probably won’t need this. :)
2. Install my kitty.conf.

## Configure neofetch
```sh
curl -L 'https://raw.githubusercontent.com/ArthurLokhov/arch_install/master/configs/.config/neofetch/neofetch.conf' > ~/.config/neofetch/neofetch.conf # (1)
```

1. Install my neofetch.conf.

## Bluetooth
```sh
paru -S bluez bluez-utils pipewire pipewire-pulse # (1)
mkdir -p ~/.config/pipewire/media-session.d/
cp /usr/share/pipewire/*.conf ~/.config/pipewire/ # (2)
vim ~/.config/pipewire/pipewire.conf # (3)

systemctl --user enable pipewire.service
systemctl --user enable pipewire-pulse.service
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
```

1. Install libraries for bluetooth working.
2. Copy the configs.
3. Uncomment and modify the line `default.clock.allowed-rates = [ 44100 48000 ]`