# 🔮 Настройка Zsh

## Кастомизация ZSH

```
paru -S zsh-completions zsh-autosuggestions zsh-fast-syntax-highlighting fzf # (1)
cd ~
sudo curl -L "https://raw.githubusercontent.com/ArthurLokhov/arch_install/main/configs/zsh/.zshenv" -O
sudo curl -L "https://raw.githubusercontent.com/ArthurLokhov/arch_install/main/configs/zsh/.zshrc" -O
```

## Устанавливаем вспомогательные утилиты

```
paru -S bat exa fd
```

1. `bat` является заменой для`cat` с подсветкой синтаксиса, строк и т.д. .
2. `exa` это замена для `ls` с поддержкой git, подсветкой и т.д. .

## Настройка Bat

```
mkdir ~/Downloads
cd ~/Downloads
git clone git@github.com:catppuccin/bat.git
cd bat
mkdir -p "$(bat --config-dir)/themes"
cp *.tmTheme "$(bat --config-dir)/themes"
bat cache --build
bat --list-themes
vim ~/.config/bat/config ->
    --theme="Catppuccin-macchiato"
```

## Настройка Exa

```
vim ~/.zshrc ->
    alias exa="exa --color --time-style=long-iso"
    alias ls="exa"
    alias la="ls --long --header --icons"
    alias lg="ls --long --header --icons --git"
```

## Настройка fd

```
vim ~/.zshrc ->
    alias fd="fd -HI"
```

## Настройка Powerlevel10k

```
paru -S zsh-theme-powerlevel10k
curl -L "https://raw.githubusercontent.com/ArthurLokhov/arch_install/master/configs/.p10k.zsh" > ~/.p10k.zsh 
vim ~/.zshrc ->
    source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
    source ~/.p10k.zsh
```
