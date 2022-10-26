# Nvidia configuration

## Nvidia drivers
```sh
sudo pacman -S linux-headers
sudo pacman -S nvidia nvidia-utils nvidia-settings opencl-nvidia vulkan-icd-loader libglvnd libvdpau libxnvctrl
sudo vim /etc/mkinitcpio.conf ->
    MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm) # (1)
mkinitcpio -P linux
cd /etc/pacman.d/hooks
sudo curl -L "https://raw.githubusercontent.com/ArthurLokhov/arch_install/main/configs/nvidia/nvidia.hook" -O # (2)
sudo nvidia-xconfig # (3)
sudo mv /etc/X11/xorg.conf /etc/X11/xorg.conf.d/20-nvidia.conf # (4)
sudo reboot
nvidia-smi # (5)
sudo systemctl enable nvidia-persistenced.service # (6)
```

1. Edit the modules line.
2. Download the nvidia hook.
3. Generate the external nvidia settings.
4. And after add this lines in `Device` section:
```sh
Option "TripleBuffer" "on"
Option "Coolbits" "28"
```
And this lines in `Screen` section:
```sh
Option "metamodes" "nvidia-auto-select +0+0 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}"
Option "AllowInderectGLXProtocol" "off"
```
5. Launch to test if all cards are detected.
6. Enabling persistence daemon for `CUDA`.
