function nu --wraps='npm uninstall' --description 'alias nu=npm uninstall'
    if type -f npm &>/dev/null
        npm uninstall $argv
    else
        missing_package npm
    end
end
