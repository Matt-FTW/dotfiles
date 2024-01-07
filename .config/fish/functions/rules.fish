function rules
    set currentDirectory (pwd)
    set selectedRule (fd -I --hidden --type f . ~/.config/nvim/rules/ | fzf --preview "bat {}")

    if test -n "$selectedRule"
        cp $selectedRule $currentDirectory
        echo "'$selectedRule' copied"
    end
end
