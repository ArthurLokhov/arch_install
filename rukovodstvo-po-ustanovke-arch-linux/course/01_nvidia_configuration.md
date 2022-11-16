# 🔋 Драйвера Nvidia

## Установка Nvidia

```
paru -S linux-headers
paru -S nvidia-dkms nvidia-utils nvidia-settings opencl-nvidia vulkan-icd-loader libglvnd libvdpau libxnvctrl
sudo vim /etc/mkinitcpio.conf ->
    MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm) # (1)
sudo mkinitcpio -P linux
cd /etc/pacman.d/hooks
sudo curl -L "https://raw.githubusercontent.com/ArthurLokhov/dots/main/etc/pacman.d/hooks/nvidia.hook" -O # (2)
sudo nvidia-xconfig # (3)
sudo mv /etc/X11/xorg.conf /etc/X11/xorg.conf.d/20-nvidia.conf
```

1. Отредактируйте переменную MODULES. Если вы используйте BTRFS добавьте `crc32c libcrc32c zlib_deflate btrfs.`
2. Скачайте nvidia хук.
3. Сгенерируйте свою конфигурацию видеокарты Nvidia.

Добавим в секцию Device следующие строки:

```
Option "TripleBuffer" "on"
Option "Coolbits" "28"
```

И эти строки в секцию Screen:

```
Option "AllowInderectGLXProtocol" "off"
```

## Включаем поддержку nvidia\_drm

```
vim /etc/default/grub ->
    GRUB_CMDLINE_LINUX="nvidia_drm.modeset=1" # (1)
```

1. Добавляем в аргументы GRUB-CMDLINE-LINUX nvidia-drm.modeset=1.

## Установка микрокодеков

```
paru -S intel-ucode iucode-tool # (1)
paru -S amd-ucode iucode-tool # (2)
sudo mkinitcpio -P
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

1. Если вы используйте CPU от Intel.
2. Если вы используйте CPU от AMD.

## Дополнительные настройки Nvidia (Tweaks)

```
cd ~/Downloads
git clone https://aur.archlinux.org/nvidia-tweaks.git
cd nvidia-tweaks
makepkg -sric
```

## Включаем поддержку nvidia\_persistenced

```
sudo reboot
nvidia-smi # Проверяем работает ли видеокарта.
sudo systemctl enable nvidia-persistenced.service
```
