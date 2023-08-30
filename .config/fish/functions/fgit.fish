function fgit --description 'List forgit options with fzf'
    set selected_command (functions | grep -o 'forgit::[^ ]*' | cut -d ':' -f 2- | sed 's/^://' | fzf)
    if [ -n "$selected_command" ]
        eval "forgit::$selected_command"
    else
        echo "Command selection canceled"
        return
    end
end
