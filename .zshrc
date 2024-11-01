# Autostart X at Login
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec startx
fi


source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Source
# Source runtime
source "$HOME/.asdf/asdf.sh"
source ~/.asdf/plugins/java/set-java-home.zsh

source $HOME/.local/scripts/commands

# Export

# Config starship prompt
eval "$(starship init zsh)"

eval $(thefuck --alias)
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"
export XDG_CONFIG_HOME="$HOME/.config"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export NVM_DIR="$HOME/.nvm"
export EDITOR="nvim"
export VISUAL="nvim"
export BAT_THEME="kanagawa"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git --exclude .venv"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git --exclude .venv"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Alias
alias vim="nvim"
alias cd="z"
alias icat="kitten icat"
alias v="fd -t f -H -E .git -E .venv -L | fzf --preview 'bat --style numbers,changes --color=always --line-range=:500 {}' | xargs nvim"
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


# Keybinds
bindkey -r "^G"
bindkey -s "^F" "tmux-sessionizer\n"
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

_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# Run macchina
macchina

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit
compinit -u

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit
compinit -u
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit
compinit -u
