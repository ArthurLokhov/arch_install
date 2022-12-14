---
description: Подходит для тех, кто не хочет заморачиваться с настройками
---

# Gnome

{% hint style="success" %}
Gnome является идеальным решением для новичков. У него из коробки есть все, что вам нужно и он не требует множества настроек.&#x20;
{% endhint %}

Чтобы установить Gnome надо скачать следующие три пакета, а также если надо _**gnome-extra**_:

* _**gnome**_ - пакет, который установит оконное окружение Gnome и связянный с ним окружением программы.
* _**gnome-extra**_ - пакет, который установит множество дополнительных утилит.
* _**gdm**_ - пакет, который установит оконный менеджер. Именно через него мы будет запускать Gnome.
* _**gnome-tweaks**_ - пакет, который установит приложение с дополнительными настройками для Gnome.

Поставим эти пакеты.

```shell
pacman -S gnome gnome-extra gdm gnome-tweaks
```

Настроим _**gdm**_ и включим его.

Сначала зайдем в файл _/etc/gdm/custom.conf_ и расскоментируем строчку "**WaylandEnable=False**", если вы не используйте _**Wayland**_. Напоминаю, мы скачивали _**X Server**_, а не _**Wayland**_.

```shell
sudo vim /etc/gdm/custom.conf
sudo systemctl enable gdm.service
```

Перезапускаем компьютер.

```shell
sudo reboot
```

Чтобы удалить _**Gnome**_.

```shell
sudo systemctl disable gdm.service
paru -Rs gnome gnome-extra gdm gnome-tweaks
```
