---
description: Нужно только пользователям Gnome
---

# 4K Монитор

{% hint style="danger" %}
**ВАЖНО**: Данная глава лишь на этапе сбора информации, то есть все что ниже не тестировалось, а сама глава не редактировалась. &#x20;
{% endhint %}

{% hint style="warning" %}
Все, что написано ниже стоит использовать только в том случае, если у вас не работает или работает плохо 4К монитор. Если все в порядке, то не стоит ничего менять.
{% endhint %}

Чтобы включить поддержку HiDPI в _**Gnome**_.

```shell
gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "[{'Gdk/WindowScalingFactor', <2>}]"
gsettings set org.gnome.desktop.interface scaling-factor 2
```

Если у вас _**Wayland**_, то можно включить дробного масштабирования. Однако могут начать плохо работать программы, которые работают с _**XWayland**_.

{% hint style="info" %}
**ВНИМАНИЕ**: Эта функция является экспереминтальной на данный момент.
{% endhint %}

```shell
gsettings set org.gnome.mutter Experimental-Features "['scale-monitor-framebuffer']"
```

Если вы пользуетесь _**Gnome**_ на _**X Server**_, то можете скачать специальный патч для масштабирования с помощью _**Randr**_.&#x20;

{% hint style="info" %}
**ВНИМАНИЕ**: Эта функция является экспереминтальной на данный момент.
{% endhint %}

```shell
paru -S mutter-x11-scaling
gsettings set org.gnome.mutter Experimental-Features "['x11-randr-fractional-scaling']"
```
