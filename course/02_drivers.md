# 🪛 Настройка драйверов

## Клавиатура

```
sudo vim /etc/X11/xorg.conf.d/00-keyboard.conf # (1)
    Section "InputClass"
            Identifier "system-keyboard"
            MatchIsKeyboard "on"
            Option "XkbLayout" "us,ru"
            Option "XkbModel" "pc105"
            Option "XkbOptions" "grp:alt_shift_toggle"
    EndSection
```

1. Создаем файл 00-keyboard.conf с описанием того, как должна себя вести клавиатура.

## Драйвер для  Wireless USB Driver от компании TP-link

```
git clone https://aur.archlinux.org/rtl88xxau-aircrack-dkms-git.git
cd tl88xxau-aircrack-dkms-git
makepkg -s
paru -U  rtl88xxau-aircrack-dkms-git-r1211.e7a4a39-1-x86_64.pkg.tar.zst
sudo systemctl stop dhcpcd.service
sudo systemctl disable dhcpcd.service
```
