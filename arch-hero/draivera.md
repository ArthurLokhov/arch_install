---
description: Ох, Железки мои, Железки любимые.
---

# 🔌 Драйвера

## Bluetooth и звуковая карта

```
paru -S bluez bluez-utils
paru -S pipewire lib32-pipewire pipewire-alsa pipewire-pulse pipewire-jack lib32-pipewire-jack wireplumber pavucontrol alsa-utils # (1) 
mkdir -p ~/.config/pipewire/media-session.d/
cp /usr/share/pipewire/*.conf ~/.config/pipewire/
vim ~/.config/pipewire/pipewire.conf

systemctl --user enable pipewire.service
systemctl --user enable pipewire-pulse.service
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
```
