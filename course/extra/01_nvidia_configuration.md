# Nvidia configuration

## Nvidia drivers(Standard)
```sh
paru -S linux-headers
paru -S nvidia-dkms nvidia-utils nvidia-settings opencl-nvidia vulkan-icd-loader libglvnd libvdpau libxnvctrl
sudo vim /etc/mkinitcpio.conf ->
    MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm) # (1)
mkinitcpio -P linux
cd /etc/pacman.d/hooks
sudo curl -L "https://raw.githubusercontent.com/ArthurLokhov/arch_install/main/configs/nvidia/nvidia.hook" -O # (2)
sudo nvidia-xconfig
sudo mv /etc/X11/xorg.conf /etc/X11/xorg.conf.d/20-nvidia.conf
sudo reboot
nvidia-smi # (5)
sudo systemctl enable nvidia-persistenced.service # (6)
```

1. Edit the modules line. If you use BTRFS:
```sh
sudo vim /etc/mkinitcpio.conf ->
    MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm crc32c libcrc32c zlib_deflate btrfs)
```
2. Download the nvidia hook.
3. Generate the external nvidia settings.
4. And after add this lines in `Device` section:
```sh
Option "TripleBuffer" "on"
Option "Coolbits" "28"
```
And this lines in `Screen` section:
```sh
Option "AllowInderectGLXProtocol" "off"
```
5. Launch to test if all cards are detected.
6. Enabling persistence daemon for `CUDA`.

<!-- nvidia-dkms -->
## Nvidia drivers(Optimize)
```sh
paru -S linux-headers
paru -S nvidia nvidia-utils nvidia-settings opencl-nvidia vulkan-icd-loader libglvnd libvdpau libxnvctrl
paru -S lib32-nvidia-utils lib32-vulkan-icd-loader lib32-opencl-nvidia
sudo vim /etc/mkinitcpio.conf ->
    MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)
mkinitcpio -P linux
cd /etc/pacman.d/hooks
sudo curl -L "https://raw.githubusercontent.com/ArthurLokhov/arch_install/main/configs/nvidia/nvidia.hook" -O
sudo nvidia-xconfig
sudo mv /etc/X11/xorg.conf /etc/X11/xorg.conf.d/20-nvidia.conf
```