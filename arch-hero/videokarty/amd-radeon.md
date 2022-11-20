---
description: Сторона красных
---

# AMD RADEON

{% hint style="success" %}
Если у вас карта от AMD RADEON советую выбирать _**Wayland**_ в качестве оконного сервера.&#x20;
{% endhint %}

## Установка AMD RADEON

Для начала установим пакет с заголовочными файлами linux ядра.

```shell
paru -S linux-headers
```

Теперь установим пакеты, необходимые для работы AMD RADEON.

```
paru -S mesa mesa-vdpau vulkan-radeon glu vulkan-icd-loader
```

Некоторые программы до сих пор работают в 32-бита. Для таких программ поставим 32-битные версии пакетов.

```shell
paru -S lib32-mesa lib32-mesa-vdpau lib32-vulkan-radeon lib32-glu lib32-vulkan-icd-loader
```

Если будете использовать _**X Server**_, то поставьте следующие пакеты.

```shell
paru -S xf86-video-amdgpu
```

## Настройка системы

Для начала надо узнать к какой серии принадлежит видеокарта  _**Southern Islands(SI)**_ или _**Sea Islands(CIK).**_&#x20;

Затем надо в файле _/etc/default/grub_ изменить переменную "**GRUB\_CMDLINE\_LINUX**".&#x20;

```shell
GRUB_CMDLINE_LINUX="radeon.cik_support=0 amdgpu.cik_support=1"
```

Выже приведен пример для _**Sea Islands**_, если у вас _**Southern Islands**_, то вместо _**cik**_ надо указать _**si.**_

```shell
GRUB_CMDLINE_LINUX="radeon.si_support=0 amdgpu.si_support=1"
```

Теперь подключим необходимые нам модули в файле _/etc/mkinitcpio.conf_. Для этого добавим в переменную _**MODULES**_ модули, отвечающие за работу AMD RADEON.&#x20;

{% hint style="warning" %}
**ВАЖНО**: Строго категорически в том же порядке, что и ниже!
{% endhint %}

```
MODULES=(amdgpu radeon)
```

Пересобираем конфигурацию системы с учетом новых изменений.

```shell
sudo mkinitcpio -P linux
```

## Если вы используете X Server...

Если будете использовать _**X Server**_, то создайте файл _/etc/X11/xorg.conf.d/20-amdgpu.conf_ и пропишите там следующие строчки.

```shell
Section "Device"
     Identifier "AMD"
     Driver "amdgpu"
EndSection
```

Надо дать знать нашему загрузчика, что у нас изменилась конфигурация устройства.

```shell
sudo mkinitcpio -P
sudo grub-mkconfig -o /boot/grub/grub.cfg
```
