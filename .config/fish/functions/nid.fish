function nid --wraps='npm install --save-dev' --description 'alias nid=npm install --save-dev'
    if type -f npm &>/dev/null
        npm install --save-dev $argv
    else
        missing_package npm
    end
end
