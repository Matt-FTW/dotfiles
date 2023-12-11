function nud --wraps='npm uninstall --save-dev' --description 'alias nud=npm uninstall --save-dev'
    npm uninstall --save-dev $argv
end
