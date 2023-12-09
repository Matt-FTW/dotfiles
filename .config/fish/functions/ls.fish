function ls --wraps='eza -a --icons --group-directories-first' --description 'alias ls=eza -a --icons --group-directories-first'
    eza -a --icons --group-directories-first --hyperlink $argv
end
