function i --wraps='yay -S ' --description 'alias i=yay -S '
    if type -f yay &>/dev/null
        yay -Sy $argv
    else
        pacman -Sy $argv
    end
end
