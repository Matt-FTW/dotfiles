function ls --wraps='eza -a --icons --group-directories-first' --description 'alias ls=eza -a --icons --group-directories-first'
    if type -f eza &>/dev/null
        eza -a --icons --group-directories-first --hyperlink $argv
    else
        missing_package eza
    end
end
