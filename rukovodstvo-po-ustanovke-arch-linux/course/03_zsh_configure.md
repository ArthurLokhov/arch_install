# 🔮 Настройка Zsh

## Кастомизация ZSH

```
paru -S zsh-completions zsh-autosuggestions zsh-fast-syntax-highlighting fzf\
paru -S bat exa fd
paru -S zsh-theme-powerlevel10k
```

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
```
