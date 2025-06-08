function lzd --wraps=lazydocker --description 'alias lzd=lazydocker'
    if type -f lazydocker &>/dev/null
        lazydocker $argv
    else
        missing_package lazygit
    end
end
