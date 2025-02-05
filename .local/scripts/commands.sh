#!/bin/zsh

# Setup python virtual environment
pyvenv() {
  python3 -m venv venv
  source venv/bin/activate
}

# Yazi
yy() {
  tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


# Tmux sessionzier
tmux-sessionizer() {
  if [[ $# -eq 1 ]]; then
      selected=$1
  else
      selected=$(fd -t d -d 1 . '/Users/bcao/Documents/course' '/Users/bcao/Documents/projects' | fzf)
  fi

  if [[ -z $selected ]]; then
      return 0
  fi

  selected_name=$(basename "$selected" | tr . _)
  tmux_running=$(pgrep tmux)

  if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
      tmux new-session -s $selected_name -c $selected
      return 0
  fi

  if ! tmux has-session -t=$selected_name 2> /dev/null; then
      tmux new-session -ds $selected_name -c $selected
  fi

  if [[ -n $TMUX ]]; then
    tmux switch-client -t $selected_name
  else
    tmux attach -t $selected_name
  fi
}

tmux-personal() {
  tmux_running=$(pgrep tmux)
  selected_name="personal"
  selected=$HOME

  if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
      tmux new-session -s $selected_name -c $selected
      return 0
  fi

  if ! tmux has-session -t=$selected_name 2> /dev/null; then
      tmux new-session -ds $selected_name -c $selected
  fi

  if [[ -n $TMUX ]]; then
    tmux switch-client -t $selected_name
  else
    tmux attach -t $selected_name
  fi
}
