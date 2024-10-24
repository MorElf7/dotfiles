# Autostart X at Login
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec startx
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f "$HOME/.p10k.zsh" ]] || source $HOME/.p10k.zsh

source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[[ -s "$HOME/.nvm/nvm.sh" ]] && source $HOME/.nvm/nvm.sh

source $HOME/.local/scripts/fzf-git.sh
source $HOME/.local/scripts/commands
# source $HOME/.local/scripts/git.plugin.zsh

# Export
eval $(thefuck --alias)
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"
export XDG_CONFIG_HOME="$HOME/.config"
export NVM_DIR="$HOME/.nvm"
export EDITOR="nvim"
export VISUAL="nvim"
export BAT_THEME="kanagawa"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git --exclude .venv"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git --exclude .venv"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="/Users/bcao/.ebcli-virtual-env/executables:$PATH"

# # Alias
alias cat="bat"
alias fzf="fzf --preview 'bat --style numbers,changes --color=always --line-range=:500 {}'"
alias vim="nvim"
alias pip="pip3"
alias python="python3"
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
bindkey -s "^f" "tmux-sessionizer\n"
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

