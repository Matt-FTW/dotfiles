function gpt --wraps='tgpt -i' --description 'alias gpt=tgpt -i'
    if type -f tgpt &>/dev/null
        tgpt $argv
    else
        missing_package tgpt
    end
end
