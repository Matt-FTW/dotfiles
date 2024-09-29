function nls --wraps='npm list' --description 'alias nls=npm list'
    if type -f npm &>/dev/null
        npm list $argv
    else
        missing_package npm
    end
end
