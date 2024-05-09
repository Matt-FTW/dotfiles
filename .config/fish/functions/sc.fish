function sc --wraps='source $XDG_CONFIG_HOME/fish/config.fish' --description 'alias r=source $XDG_CONFIG_HOME/fish/config.fish'
    source $XDG_CONFIG_HOME/fish/config.fish $argv
end
