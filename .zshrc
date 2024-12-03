eval $(/opt/homebrew/bin/brew shellenv)

# Export
# export CARGO_HOME=$HOME/.asdf/shims/cargo
# export RUSTUP_HOME=$HOME/.asdf/shims/rustup
BREW_PREFIX=$(brew --prefix)

export XDG_CONFIG_HOME="$HOME/.config"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export NVM_DIR="$HOME/.nvm"
export ESP_IDF_MONITOR_CFGFILE="$HOME/esp-idf-monitor.cfg"
export EDITOR="nvim"
export VISUAL="nvim"
export BAT_THEME="Catppuccin Mocha"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git --exclude .venv"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git --exclude .venv"
export PNPM_HOME="/Users/bcao/Library/pnpm"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
export PATH="/Users/bcao/.ebcli-virtual-env/executables:$PATH"
export PATH="/Library/TeX/texbin/:$PATH"
export PATH="$BREW_PREFIX/opt/curl/bin:$PATH"
export LDFLAGS="-L$BREW_PREFIX/opt/curl/lib"
export CPPFLAGS="-I$BREW_PREFIX/opt/curl/include"
export PKG_CONFIG_PATH="$BREW_PREFIX/opt/curl/lib/pkgconfig"

# append completions to fpath
if type brew &>/dev/null; then
  FPATH=$BREW_PREFIX/share/zsh-completions:$FPATH
  fpath=(${ASDF_DIR}/completions $fpath)
  
  autoload -Uz compinit
  if [ "$(find ~/.zcompdump -mtime 1)" ] ; then
      compinit
  fi
  compinit -C
fi

# Alias
# alias ip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias ka="sudo kanata_macos_arm64 -c  $HOME/.config/kanata/kanata.kdb"
alias vim="nvim"
alias get_idf=". $HOME/esp/esp-idf/export.sh"
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
HISTSIZE=5000
SAVEHIST=5000
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

# Connect to tmux on shell creation
# if [[ -z $TMUX ]]; then
#   tmux-personal
# fi

# Run macchina
macchina

# Source runtime
source $HOME/.local/scripts/commands.sh

eval $(thefuck --alias)
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"

# Config starship prompt
eval "$(starship init zsh)"

source $BREW_PREFIX/opt/asdf/libexec/asdf.sh
source $HOME/.asdf/plugins/java/set-java-home.zsh
source $BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
