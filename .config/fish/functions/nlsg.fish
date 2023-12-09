function nlsg --wraps='npm list --global' --description 'alias nlsg=npm list --global'
    npm list --global $argv
end
