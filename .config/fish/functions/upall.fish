function upall --wraps=topgrade --description 'alias upall=topgrade'
    if type -f topgrade &>/dev/null
        topgrade -k --no-self-update $argv
    else
        missing_package topgrade
    end
end
