---
description: Магазин Flatpak приложений от Gnome
---

# Flathub

<figure><img src="../../.gitbook/assets/image (4).png" alt=""><figcaption><p><a href="https://flatpak.org/setup/">Flatpak</a></p></figcaption></figure>

{% hint style="info" %}
_**Flathub**_ стремится быть местом для получения и распространения приложений для Linux. Он работает на основе _**Flatpak**_ , которая позволяет запускать приложения _**Flathub**_ практически на любом дистрибутиве Linux.
{% endhint %}

{% hint style="info" %}
_**Flatpak**_ — это утилита для развёртывания, управления пакетами и виртуализации для Linux. Предоставляет песочницу, в которой пользователи могут запускать приложения без влияния на основную систему. Приложения, использующие _**Flatpak**_, требуют дополнительных разрешений на использование дискового пространства.
{% endhint %}

{% hint style="success" %}
Если вы выбираете между _**Snap**_ и _**Flathub**_, то смело ставьте _**Flathub**_.
{% endhint %}

Чтобы установить _**Flatpak**_ введите данную команду.

```shell
paru -S flatpak
```

После установки надо перезапустить систему.

```shell
sudo reboot
```

Также нам надо поключить _**Flathub**_ репозиторий.

```shell
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

## Команды

Чтобы установить программу.

```shell
flatpak install название_пакета
```

Чтобы удалить программу.

```shell
flatpak uninstall название_пакета
```

Чтобы  посмотреть список установленных пакетов.

```shell
flatpak list --app
```

Чтобы найти тот или иной пакет.

```shell
flatpak search название_пакета
```

Чтобы обновить все _**Flatpak**_ пакеты.

```shell
flatpak update
```

Чтобы подключить внешний репозиторий, надо использовать данную команду. Вместо _**\<name>**_ впишите наименование репозитория, а вместо _**\<url>**_ ссылку на его _.flatpackrepo_.

```shell
flatpak remote-add --if-not-exists <name> <url>
```

Чтобы отключить внешний репозиторий.

```shell
flatpak remote-delete <name>
```
