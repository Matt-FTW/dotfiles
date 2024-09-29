function nup --wraps='npm update' --description 'alias nup=npm update'
    if type -f npm &>/dev/null
        npm update $argv
    else
        missing_package npm
    end
end
