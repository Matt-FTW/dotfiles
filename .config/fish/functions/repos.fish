function repos --description 'Open Git directories in ~/Repos with fzf in a new Kitty tab'
    set selected_category (echo -e "Personal\nClass\nWork\nCommunity" | fzf --prompt "Select category: ")

    if test -n "$selected_category"
        set selected_dir (fd --type d --base-directory ~/Repos/"$selected_category"/ -H '^\.git$' -d 3 | sd '\.git/' '' | fzf)

        if test -n "$selected_dir"
            set tab_title (basename "$selected_dir")
            set new_tab_cmd "kitty @ launch --type=tab --tab-title \"$tab_title\" ~/Repos/$selected_category/$selected_dir"
            eval $new_tab_cmd
        end
    end
    commandline -f repaint
end
