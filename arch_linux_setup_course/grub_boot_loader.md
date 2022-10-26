# Configure Grub boot loader

## Install Grub boot loader
```sh
pacman -S grub efibootmgr dosfstools mtools
```

## Create the Grub loader
```sh
sudo vim /etc/default/grub ->
    GRUB_DISABLE_OS_PROBER=false # (1)
pacman -S os-prober ntfs-3g
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB --recheck # (2)
grub-mkconfig -o /boot/grub/grub.cfg # (3)
```
1. Uncomment this line.
2. Install the grub loader for `x86_64` arch with id `grub_uefi`. You should recheck this command, it's may different to you.
3. Make the Grub loader config `grub.cfg`.

If Windows boot manager don't found, you should repeat grub-mkconfig after reboot.

## Enable system services
```sh
systemctl enable dhcpcd.service
systemctl enable NetworkManager.service
```

## Reboot
```sh
exit
umount -lR /mnt
reboot
```

## Windows Boot Manager(After reboot)
```sh
mount /dev/sda1 /boot/efi/
grub-mkconfig -o /boot/efi/EFI/grub/grub.cfg
reboot
```

## Next...
Chapter 4: [`Post installing setup`](./post_install_setup.md).