# 🕹 (Скоро) Конфигурация под игры

## Установка кастомного ядра Xanmod

### ВНИМАНИЕ!!!

Данная процедура длится в районе 3-х часов, так как на arch linux данное ядро не скачивается сразу скомпилированным, а компилируется с нуля.

```
paru -S linux-xanmod linux-xanmod-headers
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo reboot
```
