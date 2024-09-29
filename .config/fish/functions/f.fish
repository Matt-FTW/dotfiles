function f --wraps=fzf --description 'alias f=fzf'
    if type -f fzf &>/dev/null
        fzf $argv
    else
        missing_package fzf
    end
end
