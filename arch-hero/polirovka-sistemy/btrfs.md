---
description: Файловая система
---

# BTRFS

## Создание разделов с BTRFS

Во время установки системы, вместо _**ext4**_ мы можем использовать _**btrfs**_.  Однако стоит иметь ввиду, что раздел с играми стоит оставлять в _**ext4**_.&#x20;

К примеру можно сделать так:

* раздел root = /mnt
* раздел home = /mnt/home
* раздел games = /mnt/home/games
* раздел swap

```shell
mkfs.btrfs /dev/nvme0n1p5
mkfs.btrfs/dev/nvme0n1p6
mkfs.ext4 /dev/nvme0n1p7
mkswap /dev/nvme0n1p8
```

```shell
mount /dev/nvme0n1p5 /mnt
mkdir /mnt/home
mount /dev/nvme0n1p6 /mnt/home
mkdir /mht/home/games
mount /dev/nvme0n1p7 /mnt/home/games
swapon /dev/nvme0n1p8
mkdir /mnt/efi
```

После создания пользователя, перенесьте _/mnt/home/games_ в _/mnt/home/\<user>/games_. Также изменитье _/etc/fstab_ соответственно.

## BTRFS Subvolumes

Для начала надо убедиться, что в /mnt ничего нету.

```shell
ls -a /mnt
```

Далее создаем раздел, где будем хранить наши subvolumes.

```shell
sudo mkdir /mnt/btrfs
```

Смонтируем туда наши разделы, на которых установлена система(root и home)

```shell
sudo mount /dev/nvme0n1p5 /mnt/btrfs/@
sudo mount /dev/nvme0n1p6 /mnt/btrfs/@home
```

Затем правим FSTAB.

```shell
sudo vim /etc/fstab
```

{% hint style="warning" %}
Меняем root на @, а /home на @home
{% endhint %}

Обновляем grub

```shell
sudo grub-mkconfig -o /boot/grub/grub.cfg
sync
sudo umount -r /mnt/btrfs
sudo reboot
```
