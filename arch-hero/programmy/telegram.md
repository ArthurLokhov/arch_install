---
description: Мессенджер
---

# Telegram

<figure><img src="../../.gitbook/assets/image (1).png" alt=""><figcaption></figcaption></figure>

Устанавливаем следующей командой.

```shell
flatpak install flathub org.telegram.desktop
```

Также нам надо исправить баг с слишком большим курсором, если он есть.

```shell
sudo flatpak override --env=XCURSOR_SIZE=12 org.telegram.desktop
```

Если телеграм не использует установленную тему для курсора мыши.

```shell
flatpak --user override --filesystem=/home/$USER/.icons/:ro org.telegram.desktop
```

```shell
flatpak --user override --filesystem=/usr/share/icons/:ro org.telegram.desktop
```
