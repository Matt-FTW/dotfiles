function repos --description 'Open Git directories in ~/Repos with fzf in a new Kitty tab'
    set selected_dir (find ~/Repos -type d -exec test -e '{}/.git' ';' -print -prune | fzf)

    if test -n "$selected_dir"
        set tab_title (basename "$selected_dir")
        set new_tab_cmd "kitty @ set-tab-title \"$tab_title\"; and cd $selected_dir; and onefetch"
        eval $new_tab_cmd
    end

    commandline -f repaint
end
