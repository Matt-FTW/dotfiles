function up --wraps='yay -Syu' --description 'alias up=yay -Syu'
    if type -f topgrade &>/dev/null
        topgrade -k --only system
    else if type -f yay &>/dev/null
        yay -Syu $argv
    else
        pacman -Syu $argv
    end
end
