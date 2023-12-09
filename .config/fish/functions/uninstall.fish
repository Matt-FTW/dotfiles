function uninstall --wraps='yay -R ' --description 'alias uninstall=yay -R '
    yay -R $argv
end
