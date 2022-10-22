# Zsh Autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
# Fast Syntax Highlighting
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
fast-theme free
# Fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
# Exa
alias exa"exa --color --time-style=long-iso"
alias ls="exa"
alias la="ls --long --header --icons"
alias lg="ls --long --header --icons --git"