function ni --wraps='npm install' --description 'alias ni=npm install'
    if type -f npm &>/dev/null
        npm install $argv
    else
        missing_package npm
    end
end
