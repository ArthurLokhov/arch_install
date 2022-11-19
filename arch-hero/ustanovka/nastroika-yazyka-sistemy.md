---
description: What language are you a native speaker of?
---

# 4⃣ Настройка языка системы

## Устанавливаем раскладку клавиатуры

Посмотрим перечень всех существующих раскладок типа qwerty.

```shell
ls /usr/share/kbd/keymaps/i386/qwerty
```

Теперь выбирем нужную и установим с помощью loadkeys. Я поставлю русскую раскладку.

```shell
loadkeys /usr/share/kbd/keymaps/i386/qwerty/ru.map.gz
```

На данный момент, чтобы переключать раскладку надо использовать сочетания клавищ ctrl+shift, но позже вы это поменяем, также вместо русских букв вы увидите квадраты, мы не установили шрифт с поддержкой русских букв.&#x20;

## Генерируем языковые локали

Откроем файл /etc/locale.gen и расскоментируем строчки с нужными нам локалями. Затем выполним команду locale-gen. Выбираем en\_US.UTF\_8 и ru\_RU.UTF-8, если у вас русская раскладка.

```shell
vim /etc/locale.gen
locale-gen
```

Далее нам надо сказать системе, где какую локаль она должна применять. Для этого скачайте мои настройки и поместите их в файл /etc/locale.conf.

```shell
curl -L 'https://raw.githubcontentuser.com/ArthurLokhov/dots/main/etc/locale.conf' > /etc/locale.conf
```

У меня настроено таким образом: интерфейс системы на английском, а все остальное на русскомю

{% hint style="info" %}
Если вас это не устраивает и вы хотите русский интерфейс, то замените значения LANG и LC\_MESSAGES на ru\_RU.UTF-8.&#x20;
{% endhint %}

## Устаналиваем временную зону

Замените /Europe/Moscow на свой часовой пояс.

```shell
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
```

