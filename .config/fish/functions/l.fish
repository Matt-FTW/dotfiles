function l --wraps='eza --long --header -a --icons --git --group-directories-first' --description 'alias l=eza --long --header -a --icons --git --group-directories-first'
    if type -f eza &>/dev/null
        eza --long --header -a --icons --git --group-directories-first --hyperlink $argv
    else
        missing_package eza
    end
end
