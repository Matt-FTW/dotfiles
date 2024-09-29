function codeinfo --wraps='scc ./' --description 'alias codeinfo=scc ./'
    if type -f scc &>/dev/null
        scc ./ $argv
    else
        missing_package scc
    end
end
