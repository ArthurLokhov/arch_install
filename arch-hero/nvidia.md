---
description: Сторона зеленых
---

# NVIDIA

{% hint style="danger" %}
**ВАЖНО**: В данный момент не подходит для работы с _**Wayland**_. Выбирайте _**X Server**_ в качестве оконного сервера.&#x20;
{% endhint %}

## Установка NVIDIA

Для начала установим пакет с заголовочными файлами linux ядра.

```shell
paru -S linux-headers
```

Теперь установим пакеты, необходимые для работы NVIDIA.

```shell
paru -S nvidia-dkms nvidia-utils nvidia-settings opencl-nvidia vulkan-icd-loader libglvnd libvdpau libxnvctrl
```

Некоторые программы до сих пор работают в 32-бита. Для таких программ поставим 32-битные версии пакетов.

```shell
paru -S lib32-nvidia-utils lib32-opencl-nvidia lib32-vulkan-icd-loader
```

{% hint style="warning" %}
Если у вас старая видеокарта Nvidia 390, то установите пакеты, которые указаны ниже.
{% endhint %}

```shell
paru -S nvidia-390xx nvidia-390xx-settings nvidia-390xx-utils lib32-nvidia-390xx-utils lib32-opencl-nvidia-390xx opencl-nvidia-390xx libvdpau libxnvctrl-390xx vulkan-icd-loader lib32-vulkan-icd-loader
```

## Настройка системы

Самое важное это в файле _/etc/mkinitcpio.conf_ в переменную _**MODULES**_ добавить модули, связанные с NVIDIA.

```shell
MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)
```

Включаем поддержку _**nvidia\_drm**_. Для этого нужно в файле _/etc/default/grub_ изменить переменную "**GRUB\_CMDLINE\_LINUX**".&#x20;

```shell
GRUB_CMDLINE_LINUX="nvidia_drm.modeset=1"
```

Пересобираем конфигурацию системы с учетом новых изменений.

```shell
sudo mkinitcpio -P linux
```

## Настройка NVIDIA

Первым делом скачайте мой файл _/etc/pacman.d/hooks/nvidia.hook_. Данный файл нужен, чтобы в дальнейшем драйвера NVIDIA обновлялись через pacman.&#x20;

```shell
mkdir /etc/pacman.d/hooks
sudo curl -L "https://raw.githubusercontent.com/ArthurLokhov/dots/main/etc/pacman.d/hooks/nvidia.hook" > /etc/pacman.d/hooks/nvidia.hook
```

Теперь сгенерируем конфиг, который будет описывать нашу конфигурацию. Данный файл нужен для работы _**X Server**_ с NVIDIA. Для этого воспользуемся утилитой _**nvidia-xconfig**_.&#x20;

```shell
sudo nvidia-xconfig
```

Также из-за того, что файл генерируется в не совсем удобном месте, надо его переместить.

```shell
sudo mv /etc/X11/xorg.conf /etc/X11/xorg.conf.d/20-nvidia.conf
```

## Необязательные настройки

Можно установить _**nvidia-tweaks**_, чтобы модифицировать приложение "**NVIDIA Settings**" и добавить туда новые настройки.

```shell
cd ~/Downloads
git clone https://aur.archlinux.org/nvidia-tweaks.git
cd nvidia-tweaks
makepkg -sric
```

## Завершение...

Надо дать знать нашему загрузчика, что у нас изменилась конфигурация устройства.

```shell
sudo mkinitcpio -P
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

Теперь осталось перезапуститься, а после перезапуска запустить демона _**nvidia-persistenced**_.

```shell
sudo reboot
sudo systemctl enable nvidia-persistenced.service
```
