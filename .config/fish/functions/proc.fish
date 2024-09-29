function proc --wraps=sysz --description 'alias proc=sysz'
    if type -f sysz &>/dev/null
        sysz $argv
    else
        missing_package sysz
    end
end
