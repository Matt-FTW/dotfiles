function update --wraps='yay -Syu' --description 'alias update=yay -Syu'
  yay -Syu $argv
        
end
