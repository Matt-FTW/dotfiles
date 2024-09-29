function cat --wraps=bat --description 'alias cat=bat'
    if type -f bat &>/dev/null
        bat $argv
    else
        cat $argv
    end
end
