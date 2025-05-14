# Tmux sessionizer
function tmux-sessionizer
    if test (count $argv) -eq 1
        set selected $argv[1]
    else
        set selected (fd -t d -d 1 . $HOME/Documents/course $HOME/Documents/projects | fzf)
    end

    if test -z "$selected"
        return 0
    end

    set selected_name (basename "$selected" | tr ":,. " "____")
    set tmux_running (pgrep tmux)

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
