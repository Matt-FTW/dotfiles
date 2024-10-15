function wget --description 'alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'
    command wget --hsts-file="$XDG_DATA_HOME/wget-hsts" $argv
end
