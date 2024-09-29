function ld --wraps=lazydocker --description 'alias ld=lazydocker'
    if type -f lazydocker &>/dev/null
        lazydocker $argv
    else
        missing_package lazydocker
    end
end
