# Установка пакетного помощника

{% hint style="info" %}
Пакетный помощник - это программа,
{% endhint %}

## Установка Paru

```
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

1. Убедитесь, что все в порядке.
2. Раскомментируйте строчки с CombinedUpgrade, UpgradeMenu, NewsOnUpgrade. Добавьте ниже SkipReview.
3. Раскомментируйте строчку с Color.
