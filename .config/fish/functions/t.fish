function t --wraps=tmux --description 'alias t=tmux'
    tmux attach >/dev/null 2>&1 || tmux new-session $argv
end
