---
description: Рано или поздно, но мы все оказываемся здесь
---

# 🔋 Nvidia

{% hint style="success" %}
Советую использовать пакетный помощник _**paru**_. Как его установить было показано в пункте "**Полировка системы**".
{% endhint %}

## Установка Nvidia

Для начала установим пакет с заголовочными файлами linux ядра.

```shell
paru -S linux-headers
```

Теперь установим пакеты, необходимые для работы драйверов Nvidia.

```shell
paru -S nvidia-dkms nvidia-utils nvidia-settings opencl-nvidia
```

А также дополнительные пакеты для работы с графикой.

```shell
paru -S vulkan-icd-loader libglvnd libvdpau libxnvctrl
```

Некоторые программы до сих пор работают в 32-бита. Для таких программ поставим 32-битные версии пакетов.

```shell
paru -S lib32-nvidia-utils lib32-opencl-nvidia lib32-vulkan-icd-loader
```

## Настраиваем систему

Самое важное это в файле _/etc/mkinitcpio.conf_ в переменную _**MODULES**_ добавить модули, связанные с Nvidia. Должно получиться так.

```shell
MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)
```

Пересобирем конфигурацию системы с учетом новых изменений.

```shell
sudo mkinitcpio -P linux
```
