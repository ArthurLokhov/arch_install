# Bluetooth и звуковая карта

Установим необходимые пакеты.

```shell
paru -S bluez bluez-utils pipewire lib32-pipewire pipewire-alsa pipewire-pulse pipewire-jack lib32-pipewire-jack wireplumber pavucontrol alsa-utils
```

Скопируем конфиг для _**pipewire**_. &#x20;

```shell
mkdir -p ~/.config/pipewire/media-session.d/
cp /usr/share/pipewire/*.conf ~/.config/pipewire/
```

Далее надо в конфиге подправить строчку "**default.clock.allowed-rates**" и задать значение "**\[ 44100 48000 ]**" вместо "**\[ 48000 ]**".

```shell
vim ~/.config/pipewire/pipewire.conf
```

Теперь мы можем запустить _**pipewire**_ и сам _**Bluetooth**_.

```shell
systemctl --user enable pipewire.service
systemctl --user enable pipewire-pulse.service
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
```
