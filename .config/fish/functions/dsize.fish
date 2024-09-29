function dsize --wraps='dua i' --description 'alias dsize=dua i'
    if type -f dua &>/dev/null
        dua i $argv
    else
        missing_package dua-cli
    end
end
