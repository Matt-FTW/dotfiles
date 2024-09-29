function catp --wraps='bat --paging=always' --description 'alias catp=bat --paging=always'
    if type -f bat &>/dev/null
        bat --paging=always $argv
    else
        cat --paging=always $argv
    end
end
