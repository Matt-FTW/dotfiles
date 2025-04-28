function ta --wraps='tmux attach -t' --description 'alias ta=tmux attach -t'
    if type -f tmux &>/dev/null
        tmux attach
    else
        missing_package tmux
    end
end
