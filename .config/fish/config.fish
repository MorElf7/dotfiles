eval "$(/opt/homebrew/bin/brew shellenv)"
# Set environment variables
# Set XDG directories
set -x XDG_CONFIG_HOME $HOME/.config

# Starship prompt configuration
set -x STARSHIP_CONFIG $HOME/.config/starship/starship.toml

# NVM directory
set -x NVM_DIR $HOME/.nvm

# Default editors
set -x EDITOR nvim
set -x VISUAL nvim
set -x BAT_THEME "Catppuccin Mocha"

# FZF configuration
set -x FZF_DEFAULT_COMMAND "fd --hidden --strip-cwd-prefix --exclude .git --exclude .venv"
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -x FZF_ALT_C_COMMAND "fd --type=d --hidden --strip-cwd-prefix --exclude .git --exclude .venv"

# Man page configuration
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -x MANROFFOPT -c

# PNPM path - equivalent of the case statement in zsh
if not contains $PNPM_HOME $PATH
    set -x PATH $PNPM_HOME $PATH
end

# Path additions
set -x PATH /Users/bcao/.ebcli-virtual-env/executables $PATH
set -x PATH /Library/TeX/texbin/ $PATH
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH $HOME/.local/bin $PATH

# Compiler flags
set -x LDFLAGS -L/opt/homebrew/opt/curl/lib
set -x CPPFLAGS -I/opt/homebrew/opt/curl/include
set -x PKG_CONFIG_PATH /opt/homebrew/opt/curl/lib/pkgconfig

# Disable audio in clipboard operations
set -x CLIPBOARD_NOAUDIO 1

# alias ip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
# alias python="python3"
alias ka="sudo kanata -c  $HOME/.config/kanata/mac.kbd"
alias v="fd -t f -H -E .git -E .venv -L | fzf --preview 'bat --style numbers,changes --color=always --line-range=:500 {}' | xargs nvim"
alias ls="eza -la"
alias grep='grep --color=auto'
alias g='lazygit'
alias gp="git pull"
alias gP="git push"

function _fzf_compgen_path
    fd --hidden --exclude .git . $argv[1]
end

function _fzf_compgen_dir
    fd --type=d --hidden --exclude .git . $argv[1]
end
# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# Source runtime
starship init fish | source
fzf --fish | source
zoxide init fish | source
eval (hub alias -s)
thefuck --alias | source
mise activate fish | source
