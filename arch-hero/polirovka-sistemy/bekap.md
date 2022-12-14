---
description: Если что-то пошло через одно место
---

# Бекап

Мы собираемся использовать _**Timeshift**_ для бекапа системных файлов.

{% hint style="info" %}
_**Timeshift**_ - программа, предназначенная для автоматического периодического резервного копирования и восстановления системы Linux. В отличие от других программ резервного копирования, Timeshift нацелен прежде всего на сохранение системных файлов и настроек.
{% endhint %}

Установим timeshift.

```shell
paru -S timeshift
```

При запуске программы нам предложат выбрать _**RSync**_ или _**BTRFS**_. Я предпочитаю _**RSync**_, так как я использую _**ext4**_.&#x20;

<figure><img src="../../.gitbook/assets/image (10).png" alt=""><figcaption></figcaption></figure>

Далее программа предложит выбрать диск, выбираем диск, на котором стоит _**root**_ раздел.

<figure><img src="../../.gitbook/assets/image (9).png" alt=""><figcaption></figcaption></figure>

Также мы можем заплонировать время для создания бекапов. Я предпочел оставить по умолчанию, так как бекапы делаю сам.

<figure><img src="../../.gitbook/assets/image (1) (1).png" alt=""><figcaption></figcaption></figure>
