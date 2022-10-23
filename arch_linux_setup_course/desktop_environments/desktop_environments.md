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

## Install kitty
```sh
paru -S kitty
paru -R xterm # (1)
mkdir -p ~/.config/kitty
curl -L 'https://raw.githubusercontent.com/ArthurLokhov/arch_install/master/configs/kitty.conf' > ~/.config/kitty/kitty.conf # (2)
```

1. Unless you use raw X.org, you probably won’t need this. :)
2. Install my kitty.conf.

## Configure ZSH
```sh
paru -S zsh-theme-powerlevel10k
vim ~/.zshrc # (1)
curl -L 'https://raw.githubusercontent.com/ArthurLokhov/arch_install/master/configs/.p10k.zsh' > ~/.p10k.zsh # (2)
```

1. Add `source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme`.
2. Install my .p10k.zsh.