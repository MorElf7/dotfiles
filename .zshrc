# Source
eval "$(/opt/homebrew/bin/brew shellenv)"

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f "$HOME/.p10k.zsh" ]] || source $HOME/.p10k.zsh

# source $(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[[ -s "$HOME/.nvm/nvm.sh" ]] && source $HOME/.nvm/nvm.sh
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source $HOME/.sdkman/bin/sdkman-init.sh

source $HOME/.local/scripts/fzf-git.sh
source $HOME/.local/scripts/.fzf.zsh
source $HOME/.local/scripts/commands
source $HOME/.local/scripts/git.plugin.zsh

# Export
eval $(thefuck --alias)
eval "$(zoxide init zsh)"
export XDG_CONFIG_HOME="$HOME/.config"
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
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac


# # Alias
alias cat="bat"
alias fzf="fzf --preview 'bat --style numbers,changes --color=always --line-range=:500 {}'"
alias vim="nvim"
alias pip="pip3"
alias python="python3"
alias pdf="open -a 'Brave Browser'"
alias get_idf=". $HOME/esp/esp-idf/export.sh"
alias cd="z"
alias icat="kitten icat"
alias v="fd -t f -H -E .git -E .venv -L | fzf | xargs nvim"
alias ls="eza -la"
alias sed="gsed"
alias grep='grep --color=auto'
alias g='lazygit'
alias gp="git pull"
alias gP="git push"

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

macchina

# Keybinds
bindkey -r "^G"
bindkey -s "^O" "tmux-sessionizer\n"
bindkey -s "^P" "tmux-personal\n"
bindkey -s "^Y" "tmux-session-manager\n"
bindkey "^E" vi-forward-blank-word
bindkey "^B" vi-backward-blank-word

# Better command history
HISTFILE=$HOME/.zhistory
HISTSIZE=10000
SAVEHIST=10000
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

setopt autocd
