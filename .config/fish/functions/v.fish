function v --wraps=nvim --description 'alias v=nvim'
    if type -f nvim &>/dev/null
        nvim $argv
    else
        missing_package nvim
    end
end
