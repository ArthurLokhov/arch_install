---
description: Последний рывок
---

# 6⃣ Загрузчик Grub

## Установка и настройка загрузчика Grub

Для начала установим необходимые пакеты.

```shell
pacman -S grub grub-customizer ccache efibootmgr
```

Если вы используете Dual Boot, то установите _**os-prober**_, а также разрешите его использование расскоментировав строчки "**GRUB\_DISABLE\_OS\_PROBER=false**" в файле _**/etc/default/grub**_.

```shell
pacman -S os-prober
sudo vim /etc/default/grub
```

Далее установим наш загрузчик. Вместо x86\_64-efi, укажите свою архитектуру. У меня 64 битная система, поэтому я оставляю как есть.

```shell
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB --recheck
grub-mkconfig -o /boot/grub/grub.cfg
```

{% hint style="warning" %}
_**os-prober**_ может не увидеть Windows Boot Loader с первого раза. Если такое случилось, то повторите команду _**grub-mkconfig**_ после перезапуска системы.
{% endhint %}

## Перезапускаем систему

```shell
exit
umount -lR /mnt
reboot
```
