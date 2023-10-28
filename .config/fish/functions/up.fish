function up --wraps='yay -Syu' --description 'alias up=yay -Syu'
    yay -Syu $argv
end
