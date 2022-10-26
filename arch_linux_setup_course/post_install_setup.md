# Post installing setup

## Connect to the Wi-Fi
```sh
ping -c 3 www.google.com # (1)
nmcli dev wifi connect <SSID> password “<password>” # (2)
ping -c 3 www.google.com # (1)
```

1. Check the connection to the Ethernet.
2. If you need connect to Wi-Fi with name `<SSID>` and password `<password>`.

## Activate TRIM for SSDs
```sh
sudo systemctl enable fstrim.timer
```

## Configure git
```sh
git config --global user.email "<email>" # (1)
git config --global user.name "<name>" # (2)
```

1. Put your email desired `<email>`.
2. Put your name desired `<name>`.

## Install and Configure Paru
```sh
cd ~
cd ~/Downloads
git clone https://aur.archlinux.org/paru.git
cd paru
less PKGBUILD # (1)
makepkg -si
sudo vim /etc/paru.conf ->
    # (2)
sudo vim /etc/pacman.conf ->
    # (3)
```
1. Check that everything is OK.
2. Make sure that CombinedUpgrade, UpgradeMenu, NewsOnUpgrade are activated. Add SkipReview.
3. Uncomment the line Color.

## Next...
Chapter 5: [`Desktop environment`](./desktop_environments/desktop_environments.md).