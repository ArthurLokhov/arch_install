# Настройка загрузчика Grub

## Установка загрузчика Grub

```
pacman -S grub efibootmgr dosfstools mtools ntfs-3g
```

1. dosfstools, mtools и ntfs-3g нужны для совместимости с Windows.

## Настройка загрузчика Grub

```
sudo vim /etc/default/grub ->
    GRUB_DISABLE_OS_PROBER=false # (1)
pacman -S os-prober
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB --recheck # (2)
grub-mkconfig -o /boot/grub/grub.cfg # (3)
```

1. Раскомментируйте  указанную строку.
2. Устанавливаем загрузчик Grub для x86\_64 архитектуры с id GRUB. Команда может отличаться от случая к случаю.
3. Создаем файл конфигурации загрузчика Grub - `grub.cfg`.

У некоторых не находится Windows Boot Manager. Ничего страшного, просто повторите команду grub-mkconfig после перезапуска системы.

## Включаем интернет сервисы

```
systemctl enable dhcpcd.service
systemctl enable NetworkManager.service
```

## Перезапускаем системы

```
exit
umount -lR /mnt
reboot
```
