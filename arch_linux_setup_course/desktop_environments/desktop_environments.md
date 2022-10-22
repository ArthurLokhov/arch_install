# Desktop environment(Gnome or Qtile)

## X.org install
```sh
paru -S xorg-server xorg-xinit xterm
```

## Window Managers
1. [`Gnome desktop environment`](./gnome_desktop_env.md).
2. [`Qtile desktop environment`](./qtile_desktop_env.md).

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