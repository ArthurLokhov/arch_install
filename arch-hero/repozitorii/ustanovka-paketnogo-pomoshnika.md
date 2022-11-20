# Установка Paru

_**Paru**_ - это стандартный помощник по упаковки AUR в _**pacman**_ пакеты с множеством функций и минимальным взаимодействием.

## Установка Paru

Скачаем **Paru** из официального AUR.

```shell
cd ~/Downloads
git clone https://aur.archlinux.org/paru.git
```

Далее нам нужно собрать и установить этот пакет.

```shell
cd paru
makepkg -si
```

## Настройка Paru

Откроем файл _/etc/paru.conf_ и расскомментируем опции **CombinedUpgrade**, **Upgrade Menu**, **NewsOnUpgrade**. А также добавим опцию **SkipReview**. В итоге это должно выглядить так.

<figure><img src="../../.gitbook/assets/image (1) (2) (1).png" alt=""><figcaption><p>Блок [options] в файле /etc/paru.conf</p></figcaption></figure>

Затем откроем файл _/etc/pacman.conf_ и расскомментируем опцию **Color**.
