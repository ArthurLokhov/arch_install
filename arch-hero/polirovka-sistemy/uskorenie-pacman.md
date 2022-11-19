# Ускорение pacman

{% hint style="info" %}
_**Pacman**_ является официальным менеджером пакетов для дистрибутива Arch Linux. _**Pacman**_ способен сам найти зависимости, автоматически загрузить и установить все необходимые пакеты.
{% endhint %}

Откроем файл _/etc/pacman.conf_ **** и расскоментируем блок **\[multilib]**. Затем скачаем необходимые для дальнейшей работы утилиты.

```shell
sudo vim /etc/pacman.conf
pacman -Sy
pacman -S reflector rsync
```

Загрузим в наш список зеркал 25 самых быстрых сервером. Если вы живете в западной Европе или в западной части России, то советую подключаться к Германским серверам.

```shell
sudo reflector --verbose --country 'Germany' -l 25 --sort rate --save /etc/pacman.d/mirrorlist
```

Также в конец данного списка надо добавить сервера от Яндекса. Открываем файл _/etc/pacman.d/mirrorlist_ и дописываем эти строчки.

```shell
Server = http://mirror.yandex.ru/archlinux/$repo/os/$arch
Server = https://mirror.yandex.ru/archlinux/$repo/os/$arch
```

Затем запустим команду.

```shell
pacman -Suy
```
