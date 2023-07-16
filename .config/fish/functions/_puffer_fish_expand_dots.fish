function _puffer_fish_expand_dots -d 'expand ... to ../.. etc'
    set -l cmd (commandline --cut-at-cursor)
    set -l split (string split ' ' $cmd)
    switch $split[-1]
        case './*'; commandline --insert '.'
        case '*..'; commandline --insert '/..'
        case '*'; commandline --insert '.'
    end
end
