# Клавиатура

## Клавиатура

Чтобы мы могли менять раскладку с русской на английскую, мы должны создать файл конфитурации для клавиатуры _/etc/X11/xorg.conf.d/00-keyborad.conf._

```shell
sudo vim /etc/X11/xorg.conf.d/00-keyboard.conf
```

И вводим следующие.

```shell
Section "InputClass"
            Identifier "system-keyboard"
            MatchIsKeyboard "on"
            Option "XkbLayout" "us,ru"
            Option "XkbModel" "pc105"
            Option "XkbOptions" "grp:alt_shift_toggle"
EndSection
```
