function gfetch --wraps=onefetch --description 'alias gfetch=onefetch'
    if type -f onefetch &>/dev/null
        onefetch $argv
    else
        missing_package onefetch
    end
end
