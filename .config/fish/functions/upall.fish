function upall --wraps=topgrade --description 'alias upall=topgrade'
    if type -f topgrade
        topgrade $argv
    else
        echo "topgrade not found"
    end
end
