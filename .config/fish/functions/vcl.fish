function vcl --wraps='nvim --clean' --description 'alias vcl=nvim --clean'
    if type -f nvim &>/dev/null
        nvim --clean $argv
    else
        missing_package nvim
    end
end
