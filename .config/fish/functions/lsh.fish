function lsh --wraps='eza --icons --git --group-directories-first' --description 'alias lsh=eza --icons --git --group-directories-first'
    if type -f eza &>/dev/null
        eza --icons --git --group-directories-first --hyperlink $argv
    else
        missing_package eza
    end
end
