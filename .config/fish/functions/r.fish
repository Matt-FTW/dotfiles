function r --wraps='mise run' --description 'alias r=mise run'
    if type -f mise &>/dev/null
        mise run $argv
    else
        missing_package mise
    end

end
