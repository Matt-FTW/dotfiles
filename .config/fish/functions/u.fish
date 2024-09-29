function u --wraps='yay -R ' --description 'alias u=yay -R '
    if type -f yay &>/dev/null
        yay -R $argv
    else
        pacman -R $argv
    end
end
