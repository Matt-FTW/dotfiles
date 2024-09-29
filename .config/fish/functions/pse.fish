function pse --wraps=pacseek --description 'alias pse=pacseek'
    if type -f pacseek &>/dev/null
        pacseek $argv
    else
        missing_package pacseek
    end

end
