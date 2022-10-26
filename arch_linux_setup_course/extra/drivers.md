# Drivers

# Keyboard
```sh
setxkbmap -print -verbose 10
sudo vim /etc/X11/xorg.conf.d/00-keyboard.conf
    Section "InputClass"
            Identifier "system-keyboard"
            MatchIsKeyboard "on"
            Option "XkbLayout" "us,ru"
            Option "XkbModel" "pc105"
            Option "XkbOptions" "grp:alt_shift_toggle"
    EndSection
```

## TP-link Usb
```sh
git clone https://aur.archlinux.org/rtl88xxau-aircrack-dkms-git.git
cd tl88xxau-aircrack-dkms-git
makepkg -s
paru -U  rtl88xxau-aircrack-dkms-git-r1211.e7a4a39-1-x86_64.pkg.tar.zst
```