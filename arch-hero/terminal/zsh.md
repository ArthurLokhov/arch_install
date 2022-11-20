# Zsh

Установим пакеты, необходимые для кастомизации zsh.&#x20;

```shell
paru -S zsh-completions zsh-autosuggestions zsh-fast-syntax-highlighting zsh-theme-powerlevel10k
```

Далее установим пакеты, которые содержат в себе необходимые утилиты:

* _**bat**_ - более крутой аналог _**cat**_.
* _**exa**_ - более крутой аналог стандартного _**ls**_.
* _**fd**_ и _**fzf**_- просто полезные  утилиты.

```shell
paru -S bat exa fd fzf
```

Теперь скачаем конфиги для zsh и neofetch.

```shell
curl -L "https://raw.githubusercontent.com/ArthurLokhov/dots/main/.zshrc" > ~/.zshrc
curl -L "https://raw.githubusercontent.com/ArthurLokhov/dots/main/.zshenv" > ~/.zshenv
curl -L "https://raw.githubusercontent.com/ArthurLokhov/dots/main/.p10k.zsh" > ~/.p10k.zsh

mkdir ~/.config/neofetch
curl -L "https://raw.githubusercontent.com/ArthurLokhov/dots/main/.config/neofetch/config.conf" > ~/.config/neofetch/config.conf
```
