# Nvidia configuration

## Nvidia drivers
```sh
sudo pacman -S linux-headers
sudo pacman -S nvidia libglvnd nvidia-utils opencl-nvidia nvidia-settings
sudo vim /etc/mkinitcpio.conf ->
    MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm) # (1)
mkinitcpio
cd /etc/pacman.d/hooks
sudo curl -L "https://raw.githubusercontent.com/ArthurLokhov/arch_install/main/configs/nvidia.hook" -O # (2)
sudo reboot
nvidia-smi # (3)
sudo systemctl enable nvidia-persistenced.service # (4)
```

1. Edit the modules line.
2. Download the nvidia hook.
3. Launch to test if all cards are detected.
4. Enabling persistence daemon for `CUDA`.
