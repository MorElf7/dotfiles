# Autostart X at Login
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec startx
fi

# Export
# export CARGO_HOME=$HOME/.asdf/shims/cargo
# export RUSTUP_HOME=$HOME/.asdf/shims/rustup

export XDG_CONFIG_HOME="$HOME/.config"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export NVM_DIR="$HOME/.nvm"
export EDITOR="nvim"
export VISUAL="nvim"
export BAT_THEME="Catppuccin Mocha"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git --exclude .venv"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git --exclude .venv"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
export PATH="/Users/bcao/.ebcli-virtual-env/executables:$PATH"
export PATH="/Library/TeX/texbin/:$PATH"
# export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/curl/lib"
export CPPFLAGS="-I/opt/homebrew/opt/curl/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/curl/lib/pkgconfig"

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit
if [ "$(find ~/.zcompdump -mtime 1)" ] ; then
    compinit
fi
compinit -C

# Alias

# Only on Acer Nitro 5. Update name if needed
alias dual-monitor="xrandr --output HDMI-1-0 --primary --auto --output eDP-1 --auto --left-of HDMI-1-0"

alias ka="sudo $(which kanata) -c $HOME/.config/kanata/qwerty.kbd"
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
bindkey -s "^F" "tmux-sessionizer\n"
bindkey -s "^G" "tmux-personal\n"
bindkey "^E" vi-forward-blank-word
bindkey "^B" vi-backward-blank-word
bindkey "^O" clear-screen

# Better command history
HISTFILE=$HOME/.zhistory
HISTSIZE=10000
SAVEHIST=10000
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

setopt autocd

# Created by `pipx` on 2024-06-21 03:46:11
export PATH="$PATH:/Users/bcao/.local/bin"

_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# Source runtime
eval $(thefuck --alias)
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"

# Config starship prompt
eval "$(starship init zsh)"

# Run macchina
macchina

source $HOME/.local/scripts/commands

source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


