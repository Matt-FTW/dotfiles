function repos --description 'Open Git directories in ~/Repos with fzf in a new Kitty tab'
    set selected_dir (fd --type d --base-directory ~/Repos/ -H '^\.git$' -d 4 | sd '\.git/' '' | fzf)

    if test -n "$selected_dir"
        set tab_title (basename "$selected_dir")
        set new_tab_cmd "kitty @ launch --type=tab --tab-title \"$tab_title\" ~/Repos/$selected_category/$selected_dir"
        eval $new_tab_cmd
    end

    commandline -f repaint
end
