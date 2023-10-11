function yarn --description 'alias yarn=yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'
    command yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config" $argv
end
