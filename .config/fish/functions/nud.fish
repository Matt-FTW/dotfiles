function nud --wraps='npm uninstall --save-dev' --description 'alias nud=npm uninstall --save-dev'
    if type -f npm &>/dev/null
        npm uninstall --save-dev $argv
    else
        missing_package npm
    end
end
