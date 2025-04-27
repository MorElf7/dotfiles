# Personal tmux session
function tmux-personal
    set tmux_running (pgrep tmux)
    set selected_name personal
    set selected $HOME

    if test -z "$TMUX" -a -z "$tmux_running"
        tmux new-session -s $selected_name -c $selected
        return 0
    end

    if not tmux has-session -t=$selected_name 2>/dev/null
        tmux new-session -ds $selected_name -c $selected
    end

    if test -n "$TMUX"
        tmux switch-client -t $selected_name
    else
        tmux attach -t $selected_name
    end
end
