# `Working Environment Configuration`
****
## `I3 Window's Manager`

Download the minimal package of programs:
```sh
pacman -S xorg-server xorg-xinit i3-gaps i3status dmenu pcmanfm ttf-font-awesome feh lxappearance gvfs udiskie xorg-xbacklight ristretto tumbler picom alacritty [sbxkb]

echo 'exec i3' >> ~/.xinitrc
startx
```
Packages Info:
- `xorg-server xorg-xinit` - display server
- `i3-gaps` - fork of i3wm
- `i3status` - output the status line
- `dmenu` - utility to start the programs
- `pcmanfm` - file manager
- `ttf-font-awesome` - font for icons
- `feh` - utility to setup the wallpaper
- `lxappearance` - utility to setup the themes of windows, icons and cursor
- `gvfs udiskie` - utilities to auto mount of external disks
- `xorg-xbacklight` - utility to change of display brightness
- `ristretto tumbler` - utilities to show of photos and images
- `picom` - utility to setup of transparency of windows
****

## Hotkeys