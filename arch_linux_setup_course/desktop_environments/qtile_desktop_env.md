# Qtile desktop environment

## Install Gdm
```sh
paru -S gdm
sudo vim /etc/gdm/custom.conf # (1)
sudo systemctl enable gdm.service
```

1. Uncomment the line `WaylandEnable=false`.

## Install Qtile
```sh
paru -S qtile qtile-extras-git rofi python-dbus-next network-manager-applet pasystray blueman bottom picom-git google-chrome # (1)
paru -S baobab eog evince file-roller gnome-calculator gnome-characters gnome-disk-utility gnome-font-viewer gnome-logs flameshot gnome-settings-daemon nautilus # (2)

curl -L 'https://raw.githubusercontent.com/ArthurLokhov/arch_install/master/configs/.config/qtile/' > ~/.config/qtile/ # (3)
```

1. Install the qtile and main softwares.
2. Install useful Gnome softwares.
3. Install my Qtile configuration.

## Configure picom
```sh
curl -L 'https://raw.githubusercontent.com/ArthurLokhov/arch_install/master/configs/.config/picom/picom.conf' > ~/.config/picom/picom.conf # (1)
```

1. Install my picom.conf.

How to get the window class:
- Run `xprop`
- Click on the window whose `WM_CLASS` you want to know
- Use the `WM_CLASS(STRING)` name

## Configure the Cutppuccin theme (wallpaper / color / icons / cursors)

### Wallpaper
Download the wallpaper and copy it in `~/.local/share/backgrounds`.

Add the wallpaper in the screens variable in `config.py`:
```py
wallpaper_path = os.path.expanduser("~") + "/.local/share/backgrounds/"

screens = Screen(
        top=bar.Bar(
            widgets=init_bar_widgets(primary=False),
            size=24,
            margin=[5, 5, 0, 5],
        ),
        wallpaper=wallpaper_path + "<wallpaper_name>.png", # you need to add this for each screen
        wallpaper_mode="fill"
    ),
```

### Cursor
```sh
cd ~/Downloads
mkdir ~/.locale/share/icons
git clone https://github.com/catppuccin/cursors.git
cd cursors/cursors
unzip Catppuccin-Macchiato-Dark-Cursors.zip
sudo mv Catppuccin-Macchiato-Dark-Cursors ~/.local/share/icons/Catppuccin-Machiato-Dark
```

Configs:
```sh
vim ~/.icon/default/index.theme ->
    [icon theme]
    Inherits=Catppuccin-Macchiato-Dark
vim ~/.config/gtk-3.0/settings.ini ->
    [Settings]
    gtk-cursor-theme-name = Catppuccin-Macchiato-Dark
vim ~/.Xresources ->
    Xcursor.theme: Catppuccin-Macchiato-Dark
    Xcursor.size: 24
vim ~/.xinitrc ->
    xrfb -merge ~/.Xresources
gsettings set org.gnome.desktop.interface cursor-theme Catppuccin-Macchiato-Dark
gsettings set org.gnome.desktop.interface cursor-size 24  
```

### Theme and icons
```sh
paru -S catppuccin-gtk-theme-macchiato papirus-icon-theme
cd ~/Downloads
git clone https://github.com/catppuccin/papirus-folders.git
cd papirus-folders/
sudo cp -r src/* /usr/share/icons/Papirus
./papirus-folders -C cat-macchiato-blue --theme Papirus-Dark
vim ~/.config/gtk-3.0/settings.ini ->
    [Settings]
    gtk-theme-name = Catppuccin-Macchiato
    gtk-icon-theme-name=Papirus
    gtk-cursor-theme-name = Catppuccin-Macchiato-Dark
```

## Config rofi
```sh
curl -L 'https://raw.githubusercontent.com/ArthurLokhov/arch_install/master/configs/.config/rofi/config.rasi' > ~/.config/rofi/config.rasi # (1)
```
1. Install my config.rasi.

## Config flameshot
```sh
curl -L 'https://raw.githubusercontent.com/ArthurLokhov/arch_install/master/configs/.config/flameshot/flameshot.ini' > ~/.config/flameshot/flameshot.ini # (1)
```
1. Install my flameshot.ini.

## Configure other apps
```sh
paru -S d-feet
dbus-send --system --dest=org.bluez --print-reply "/org/bluez/hci0/dev_xx_xx_xx_xx_xx_xx" org.freedesktop.DBus.Properties.Get string:'org.bluez.Device1' string:'Name'
```

## Autostart
```sh
vim ~/.config/qtile/autostart.sh ->
    pasystray &
    nm-applet &
    blueman-applet &
```