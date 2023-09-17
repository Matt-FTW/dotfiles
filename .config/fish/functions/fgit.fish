function fgit --description 'List forgit options with fzf'
    set selected_command (functions | rg -o 'forgit::[^ ]*' | cut -d ':' -f 2- | sd '^:' '' | fzf)
    if [ -n "$selected_command" ]
        eval "forgit::$selected_command"
    end
    commandline -f repaint
end
