# Base Arch installation

## Change Terminal Font:
*****
```sh
setfont ter-132n # (1)
```
1. Set font with naming `ter-132n` 

## Change Keyboard Layout
*****
```sh
ls /usr/share/kbd/keymaps/i386/qwerty/ # (1)
loadkeys /usr/share/kbd/keymaps/i386/qwerty/ru.map.gz # (2) 
```
1. Print the list of keyboard layouts
2. Load the keyboard layout. I choose `QWERTY` with russian letters support.

## Coming Soon....
*****