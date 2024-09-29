function t --wraps=tmux --description 'alias t=tmux'
    if type -f tmux &>/dev/null
        tmux attach >/dev/null 2>&1 || tmux new-session $argv
    else
        missing_package tmux
    end
end
