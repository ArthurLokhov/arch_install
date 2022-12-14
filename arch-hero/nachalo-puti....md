---
description: Вперед и с песней!
---

# 🏁 Начало пути...

## Что такое Arch Linux?

Arch - это облегченный и гибкий дистрибутив Linux. Также данный дистрибутив является оптимизированным для x86-64 архитектуры и имеет оптимизированные под данную архитектуру официальные пакеты.

## Где скачать Arch  Linux?

{% embed url="https://archlinux.org/download/" %}
Arch Linux - Страница загрузки
{% endembed %}

{% embed url="https://archlinux.org/releng/releases/" %}
Arch Linux - Перечень релизов
{% endembed %}

## Как сделать загрузочную флешку?

{% hint style="info" %}
Загрузочную флешку можно сделать при помощи любой известной вам программы. Мой выбор пал на Rufus из-за его простаты.&#x20;
{% endhint %}

{% hint style="danger" %}
**ВАЖНО**: Во время записи установити схему раздела на **GPT**, если у вас UEFI, либо **MBR**, если у вас Legacy Boot система.&#x20;
{% endhint %}

{% hint style="warning" %}
**ВНИМАНИЕ**:  Если у вас Legacy Boot система и вы видете, что где-то я не прав, сообщите об этом мне. Исторически так сложилось, что на Legacy Boot у меня нету ни одного устройства, поэтому и я не имел возможности проверить.&#x20;
{% endhint %}

<figure><img src="../.gitbook/assets/image (1) (1) (1) (1).png" alt=""><figcaption><p>Rufus - настройка записи образа у меня</p></figcaption></figure>

Тут по классике: указываем флешку, загружаем скачанный .iso файл, ставим схему раздела, меняем название метки тома, если на то есть нужда.

## Dual Boot

Если планируйте устанавливать arch рядом с другой системой, то освободите место для установки системы. В Windows это делается, если не ошибаюсь, с помощью программы "Форматирование и создание разделом жесткого диска".&#x20;

Выбираем наш диск с Windows, нажимаем "сжатие" и выделяем сколько не жалко.&#x20;

{% hint style="info" %}
Количество гигабайт умножайте на 1024. Если хотите выделить 50Гб, то указывайте 51200.
{% endhint %}
