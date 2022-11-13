# 🔋 Драйвера Nvidia

## Установка Nvidia(Для стандартного ядра)

```
paru -S linux-headers
paru -S nvidia nvidia-utils nvidia-settings opencl-nvidia vulkan-icd-loader libglvnd libvdpau libxnvctrl
sudo vim /etc/mkinitcpio.conf ->
    MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm) # (1)
mkinitcpio -P linux
cd /etc/pacman.d/hooks
sudo curl -L "https://raw.githubusercontent.com/ArthurLokhov/arch_install/main/configs/nvidia/nvidia.hook" -O # (2)
sudo nvidia-xconfig # (3)
sudo mv /etc/X11/xorg.conf /etc/X11/xorg.conf.d/20-nvidia.conf
sudo reboot
nvidia-smi # (4)
sudo systemctl enable nvidia-persistenced.service # (5)
```

1. Отредактируйте переменную MODULES. Если вы используйте BTRFS добавьте `crc32c libcrc32c zlib_deflate btrfs.`
2. Скачайте nvidia хук.
3. Сгенерируйте свою конфигурацию видеокарты Nvidia.
4. Проверим, что все подключилось.
5. Включаем сервис необходимый для работы nvidia.

## Установка Nvidia(для linux\_xanmod ядра) - Мой выбор

```
paru -S linux-headers
paru -S nvidia-dkms nvidia-utils nvidia-settings opencl-nvidia vulkan-icd-loader libglvnd libvdpau libxnvctrl
paru -S lib32-nvidia-utils lib32-vulkan-icd-loader lib32-opencl-nvidia
sudo vim /etc/mkinitcpio.conf ->
    MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)
mkinitcpio -P linux
cd /etc/pacman.d/hooks
sudo curl -L "https://raw.githubusercontent.com/ArthurLokhov/arch_install/main/configs/nvidia/nvidia.hook" -O
sudo nvidia-xconfig
sudo mv /etc/X11/xorg.conf /etc/X11/xorg.conf.d/20-nvidia.conf
nvidia-smi
sudo systemctl enable nvidia-persistenced.service
```

Добавим в секцию Device следующие строки:

```
Option "TripleBuffer" "on"
Option "Coolbits" "28"
```

И эти строки в секцию Screen:

```
Option "AllowInderectGLXProtocol" "off"
```

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
