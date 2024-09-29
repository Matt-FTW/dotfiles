function lg --wraps=lazygit --description 'alias lg=lazygit'
    if type -f eza &>/dev/null
        lazygit $argv
    else
        missing_package lazygit
    end
end
