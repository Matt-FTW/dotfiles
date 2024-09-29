function nlsg --wraps='npm list --global' --description 'alias nlsg=npm list --global'
    if type -f npm &>/dev/null
        npm list --global $argv
    else
        missing_package npm
    end
end
