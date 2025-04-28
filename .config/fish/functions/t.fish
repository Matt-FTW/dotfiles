function t --wraps=tmux --description 'alias t=tmux'
    if type -f tmux &>/dev/null
        tmux new-session $argv
    else
        missing_package tmux
    end
end
