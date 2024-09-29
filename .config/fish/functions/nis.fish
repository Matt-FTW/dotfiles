function nis --wraps='npm install --save' --description 'alias nis=npm install --save'
    if type -f npm &>/dev/null
        npm install --save $argv
    else
        missing_package npm
    end
end
