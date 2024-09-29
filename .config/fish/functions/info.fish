function info --wraps=tldr --description 'alias info=tldr'
    if type -f tldr &>/dev/null
        tldr $argv
    else
        missing_package tldr
    end
end
