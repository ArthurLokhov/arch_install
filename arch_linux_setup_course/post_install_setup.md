# Post installing setup

## Connect to the Wi-Fi
```sh
ping -c 3 www.google.com # (1)
nmcli dev wifi connect <SSID> password “<password>” # (2)
ping -c 3 www.google.com # (1)
```

1. Check the connection to the Ethernet.
2. If you need connect to Wi-Fi with name `<SSID>` and password `<password>`.

## Activate TRIM for SSDs
```sh
sudo systemctl enable fstrim.timer
```

## Congigure ZSH
```sh
pacman -S zsh-completions zsh-autosuggestions zsh-fast-syntax-highlighting fzf # (1)
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

1. Install ZSH extensions.

## Install useful commands
```sh
pacman -S bat exa fd
```

1. `bat` is a replacement of `cat` with syntax highlighting, line numbers and etc.
2. `exa` is a replacement of `ls` with better coloring, git support, etc.

## Configure Bat
```sh
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

## Configure Exa
```sh
vim ~/.zshrc ->
    alias exa"exa --color --time-style=long-iso"
    alias ls="exa"
    alias la="ls --long --header --icons"
    alias lg="ls --long --header --icons --git"
```

## Configure fd
```sh
vim ~/.zshrc ->
    alias fd="fd -HI" #(1)
```

1. Ensures `fd` doesn’t filter hidden directories or files.

## Fix data/ ownership
```sh
sudo chown artlkv /data # (1)
```

1. Replate `artlkv` to your username.

## Nvidia drivers
```sh
sudo pacman -S linux-headers
sudo pacman -S nvidia libglvnd nvidia-utils opencl-nvidia nvidia-settings
sudo vim /etc/mkinitcpio.conf ->
    MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm) # (1)
sudo vim /boot/loader/entries/arch.conf -> 
    nvidia-drm.modeset=1 # (2)
sudo vim /etc/pacman.d/hooks/nvidia.hook ->
    [Trigger]
    Operation=Install
    Operation=Upgrade
    Operation=Remove
    Type=Package
    Target=nvidia
    Target=nvidia-lts

    [Action]
    Depends=mkinitcpio
    When=PostTransaction
    Exec=/usr/bin/mkinitcpio -P
sudo reboot
nvidia-smi # (3)
sudo systemctl enable nvidia-persistenced.service # (4)
```

1. Edit the modules line.
2. Add to options line.
3. Launch to test if all cards are detected.
4. Enabling persistence daemon for `CUDA`.

## Configure git
```sh
git config --global user.email "<email>" # (1)
git config --global user.name "<name>" # (2)
```

1. Put your email desired `<email>`.
2. Put your name desired `<name>`.

## Install and Configure Paru
```sh
cd ~
cd ~/Downloads
git clone https://aur.archlinux.org/paru.git
cd paru
less PKGBUILD # (1)
makepkg -si
sudo vim /etc/paru.conf ->
    # (2)
    # (3)
```
1. Check that everything is OK.
2. Make sure that CombinedUpgrade, UpgradeMenu, NewsOnUpgrade are activated. Add SkipReview.
3. Uncomment the line Color.

## Automation install configs
```sh
cd ~
sudo curl -L "https://raw.githubusercontent.com/ArthurLokhov/arch_install/main/configs/.zshenv" -O
sudo curl -L "https://raw.githubusercontent.com/ArthurLokhov/arch_install/main/configs/.zshrc" -O
cd /etc/pacman.d/hooks
sudo curl -L "https://raw.githubusercontent.com/ArthurLokhov/arch_install/main/configs/nvidia.hook" -O
```

## Coming soon...