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
paru -S mesa mesa-vdpau  vulkan-radeon glu vulkan-icd-loader
```

Некоторые программы до сих пор работают в 32-бита. Для таких программ поставим 32-битные версии пакетов.

```shell
paru -S lib32-mesa lib32-mesa-vdpau lib32-vulkan-radeon lib32-glu lib32-vulkan-icd-loader
```
