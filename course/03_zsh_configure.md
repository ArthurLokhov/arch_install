# 🔮 Настройка Zsh

## Кастомизация ZSH

```
paru -S zsh-completions zsh-autosuggestions zsh-fast-syntax-highlighting fzf # (1)
vim ~/.zshrc ->
    # Zsh Autosuggestions
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
    # Fast Syntax Highlighting
    source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
    fast-theme free
    # Fzf
    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
vim ~/.zshenv ->
    #Catpuccin Macchiato theme
    export FZF_DEFAULT_OPTS="--height 20% --border \
        --preview 'bat --style=numbers --color=always --line-range :500 {}' \
        --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
        --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
        --color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"

    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
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
vim ~/.zshrc # (1)
```

1. Добавьте строку`source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme`.

## Автоматическая установка конфигов

```
cd ~
sudo curl -L "https://raw.githubusercontent.com/ArthurLokhov/arch_install/main/configs/zsh/.zshenv" -O
sudo curl -L "https://raw.githubusercontent.com/ArthurLokhov/arch_install/main/configs/zsh/.zshrc" -O
curl -L "https://raw.githubusercontent.com/ArthurLokhov/arch_install/master/configs/.p10k.zsh" > ~/.p10k.zsh 
```
