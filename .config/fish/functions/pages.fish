function pages --wraps=navi --description 'alias pages=navi'
    if type -f navi &>/dev/null
        navi $argv
    else
        missing_package navi
    end
end
