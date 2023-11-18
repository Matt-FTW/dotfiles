function cdzi --description 'Open directories from zoxide in a new Kitty tab'
    set selected_dir (zi)

    if test -n "$selected_dir"
        set tab_title (basename "$selected_dir")
        set new_tab_cmd "kitty @ set-tab-title \"$tab_title\"; and cd $selected_dir"
    else
        commandline -f repaint
    end
end
