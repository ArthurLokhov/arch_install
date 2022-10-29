# Optimize Arch linux


## Presetup
```sh
sudo vim /etc/pacman.conf # (1)
paru -Sy
paru -S reflector rsync curl
sudo reflector --verbose --country 'Germany' -l 25 --sort rate --save /etc/pacman.d/mirrorlist
sudo vim /etc/pacman.d/mirrorlist # (2)
paru -Suy
paru -S ccache grub-customizer
```
1. Uncomment the segment `[multilib]`.
2. Add the Yandex mirrors.

## Install Nvidia drivers
Go to the [`Nvidia configuration`](./nvidia_configuration.md).

## Nvidia Settings
1. (With sudo):
- X Server XVideo Settings->select display
- PowerMizer->Prefer Maximum Performance
- X Server Display Configuration->Select Resolution->Select Hz->Save to X configuration
2. (Without sudo)
- X Server XVideo Settings->select display
- PowerMizer->Prefer Maximum Performance
- X Server Display Configuration->Select Resolution->Select Hz

## Nvidia Tweaks
```sh
cd ~/Downloads
git clone https://aur.archlinux.org/nvidia-tweaks.git
cd nvidia-tweaks
makepkg -sric
```

## Microcodes
```sh
paru -S intel-ucode iucode-tool # (1)
paru -S amd-ucode iucode-tool # (2)
sudo mkinitcpio -P
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

1. If you use Intel Core.
2. If you use AMD Core.

## Graphics Libraries(Intel)
```sh
paru -S mesa lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader
```


## Graphics Libraries(AMD)
```sh
paru -S mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader
```

## TRIM
```sh
sudo systemctl enable fstrim.timer
```

## Install Audio
```sh
paru -S pipewire pipewire-jack pipewire-alsa pavucontrol pipewire-pulse alsa-utils
```

## Delete all unneeded programs, cache and etc
```sh
paru -Syy
paru -Scc
paru -Suu
```

## Gaming
```sh
paru -S gamemode lib32-gamemode
systemctl --user enable gamemoded && systemctl --user start gamemoded # (1)
paru -S libstrangle # (2)
paru -S mangohud
curl -L "https://raw.githubusercontent.com/ArthurLokhov/arch_install/master/configs/.config/MangoHud/MangoHud.conf" > ~/.config/MangoHud/MangoHud.conf # (3)
paru -S vkbasalt
mkdir ~/.config/vkBasalt && cp /usr/share/vkBasalt/vkBasalt.conf.example ~/.config/vkBasalt/vkBasalt.conf # (4)
paru -S lutris
```

1. With Steam use `gamemoderun %command%`.
2. `strangle -v 1 60 %command%` enable VSync and 60fps. `strangle -v 3 120:60 %command%` enable adaptive VSync with 120fps, but 60fps on battery power.
3. With Steam use `mangohud %command%` for 64-bit games and `mangohud.x86 %command%` for 32-bit games.
4. With Steam use `ENABLE_VKBASALT=1 %command%`.

## Xbox controller
```sh
sudo vim /etc/modprobe.d/xbox_bt.conf # (1)
paru -S dkms bluez bluez-utils
git clone https://aur.archlinux.org/xpadneo-dkms-git.git && cd xpadneo-dkms-git && makepkg -si
```

1. Add this line `options bluetooth disable_ertm=1`.

## Install Steam
```sh
paru -S lib32-fontconfig
paru -S steam
```

## Xanmod(For Pro, not beginners)
```sh
paru -S linux-xanmod linux-xanmod-headers
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo reboot
```