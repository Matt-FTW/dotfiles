function disks --wraps=duf --description 'alias disks=duf'
    if type -f duf &>/dev/null
        duf $argv
    else
        missing_package duf
    end
end
