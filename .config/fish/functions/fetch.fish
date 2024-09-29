function fetch --wraps=fastfetch --description 'alias fetch=fastfetch'
    if type -f fastfetch &>/dev/null
        fastfetch $argv
    else
        missing_package fastfetch
    end
end
