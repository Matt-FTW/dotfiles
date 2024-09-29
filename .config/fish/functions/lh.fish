function lh --wraps='eza --long --header --icons --git --group-directories-first' --description 'alias lh=eza --long --header --icons --git --group-directories-first'
    if type -f eza &>/dev/null
        eza --long --header --icons --git --group-directories-first --hyperlink $argv
    else
        missing_package eza
    end
end
