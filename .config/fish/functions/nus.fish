function nus --wraps='npm uninstall --save' --description 'alias nus=npm uninstall --save'
    if type -f npm &>/dev/null
        npm uninstall --save $argv
    else
        missing_package npm
    end
end
