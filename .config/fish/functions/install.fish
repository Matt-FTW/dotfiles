function install --wraps='yay -S ' --description 'alias install=yay -S '
    yay -S $argv
end
