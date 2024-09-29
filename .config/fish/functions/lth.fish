function lth --wraps='eza --long --header --icons --tree --git --group-directories-first' --description 'alias lth=eza --long --header --icons --tree --git --group-directories-first'
    if type -f eza &>/dev/null
        eza --long --header --icons --tree --git --group-directories-first --hyperlink $argv
    else
        missing_package eza
    end
end
