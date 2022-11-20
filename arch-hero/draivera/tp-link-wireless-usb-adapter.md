# TP-LINK: Wireless USB Adapter

Если помните, то я говорил, что внешний Wi-Fi модуль от компании TP-LINK не работает без драйверов. Но их драйвер не работает на Linux, но я нашел решение проблемы. Собственно вот оно.

Сначала скачаем нужный пакет.

```shell
git clone https://aur.archlinux.org/rtl88xxau-aircrack-dkms-git.git
cd tl88xxau-aircrack-dkms-git
```

Теперь собирем данный пакет и затем установим его.

```shell
makepkg -s
paru -U rtl88xxau-aircrack-dkms-git-r1211.e7a4a39-1-x86_64.pkg.tar.zst
```
