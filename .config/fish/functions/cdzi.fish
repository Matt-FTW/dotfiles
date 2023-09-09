function cdzi --description 'Open directories from zoxide in a new Kitty tab'
    set selected_dir (zoxide query --list | fzf)

    if test -n "$selected_dir"
        set tab_title (basename "$selected_dir")
        set new_tab_cmd "kitty @ launch --type=tab --tab-title \"$tab_title\" $selected_dir"
        eval $new_tab_cmd
    end
end
