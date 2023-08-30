function ls --wraps='exa -a --icons --group-directories-first' --description 'alias ls=exa -a --icons --group-directories-first'
  exa -a --icons --group-directories-first $argv
        
end
