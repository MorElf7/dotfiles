# Source
eval "$(/opt/homebrew/bin/brew shellenv)"
# source $(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/.nvm/nvm.sh
eval $(thefuck --alias)
eval "$(zoxide init zsh)"
autoload -U compinit && compinit
eval "$(register-python-argcomplete pipx)"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

source $HOME/.local/scripts/fzf-git.sh
source $HOME/.local/scripts/.fzf.zsh
source $HOME/.local/scripts/commands
source $HOME/.local/scripts/git.plugin.zsh

# Export
export NVM_DIR="$HOME/.nvm"
export ESP_IDF_MONITOR_CFGFILE="$HOME/esp-idf-monitor.cfg"
export EDITOR="nvim"
export VISUAL="nvim"
export BAT_THEME="kanagawa"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git --exclude .venv"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git --exclude .venv"
export SDKMAN_DIR="$HOME/.sdkman"
export PNPM_HOME="/Users/bcao/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac


fastfetch

# # Alias
alias cat="bat"
alias fzf="fzf --preview 'bat --style numbers,changes --color=always --line-range=:500 {}'"
alias vim="nvim"
alias pip="pip3"
alias python="python3"
alias pdf="open -a 'Google Chrome'"
alias get_idf=". $HOME/esp/esp-idf/export.sh"
alias cd="z"
alias icat="kitten icat"
alias v="fd -t f -H -E .git -E .venv -L | fzf | xargs nvim"
alias ls="eza -la"
alias sed="gsed"

# Keybinds
bindkey -r "^G"
bindkey "^O" tmux-sessionizer
bindkey "^P" tmux-personal
bindkey "^Y" tmux-session-manager
bindkey $'\E[1;5C' vi-forward-blank-word
bindkey $'\E[1;5D' vi-backward-blank-word
bindkey "^E" vi-forward-blank-word
bindkey "^B" vi-backward-blank-word

