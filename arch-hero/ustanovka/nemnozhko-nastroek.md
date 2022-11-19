---
description: Начинаем начинать... Продолжаем продолжать...
---

# 5⃣ Немножко настроек

## Создание пользователя без привилегий

Сначала поставим пароль root пользователю и запомним его.

```shell
passwd
```

Теперь создадим нового пользователя. Наш пользователь принадлежит к группе пользователей users, имеет доступ к железу, хранилищу и информации о энергопотреблении. Также пользователь по умолчанию использует zsh для своего терминала. Вместо _**\<user\_name>**_ вставьте имя своего пользователя.

```shell
useradd -m -g users -G wheel,storage,power -s /bin/zsh <user_name>
```

Поставим пользователю пароль и запомним его.

```shell
passwd <user_name>
```

И самое важное: нужно открыть файл _**visudo**_ и расскоментировать следующую строчку:

<figure><img src="../../.gitbook/assets/image (4).png" alt=""><figcaption><p>Нужная строчка</p></figcaption></figure>

Чтобы открыть файл _**visudo**_, введем данную команду.

```shell
EDITOR=vim visudo
```

## Настройка сети

Пришло время настроить интернет, потому что если этого не сделать, то после перезапуска систему у нас его не будет.

Для начала настроим хосты. Нам нужно записать в файл _**/etc/hostname**_ название нашего пользователя. А также прописать локальные адреса в _**/etc/hosts**_.

```shell
echo '<user_name>' > /etc/hostname
sudo vim /etc/hosts
```

Внутри файла _**/etc/hosts**_ надо написать эти строчки.

```shell
127.0.0.1   localhost
::1         localhost   
127.0.0.1   <user_name>.localdomain localhost
```

Далее включим сервис, который отвечает за работу c интернет-модулем.&#x20;

```shell
systemctl enable NetworkManager.service
```

## Настройка зеркал

Откроем файл _**/etc/pacman.conf**_ и расскоментируем блок **\[multilib]**. Затем скачаем необходимые для дальнейшей работы утилиты.

```shell
sudo vim /etc/pacman.conf
pacman -Sy
pacman -S reflector rsync
```

Загрузим в наш список зеркал 25 самых быстрых сервером. Если вы живете в западной Европе или в западной части России, то советую подключаться к Германским серверам.

```shell
sudo reflector --verbose --country 'Germany' -l 25 --sort rate --save /etc/pacman.d/mirrorlist
```

Также в конец данного списка надо добавить сервера от Яндекса. Открываем файл _**/etc/pacman.d/mirrorlist**_ и дописываем эти строчки.

```shell
Server = http://mirror.yandex.ru/archlinux/$repo/os/$arch
Server = https://mirror.yandex.ru/archlinux/$repo/os/$arch
```

Затем запустим команду.

```shell
pacman -Suy
```
