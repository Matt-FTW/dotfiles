function repos --description 'Open Git directories in ~/Repos with fzf in a new Kitty tab'
    set gfetch "gfetch -d churn contributors --no-color-palette --no-title"
    set selected_dir (find ~/Repos -mindepth 2 -maxdepth 2 -type d -exec test -e '{}/.git' ';' -print -prune | fzf --preview "$gfetch {} && eza --long --header --icons --all --color=always --group-directories-first --hyperlink {}")

    if test -n "$selected_dir"
        set tab_title (basename "$selected_dir")
        set new_tab_cmd = ""

        if zellij ls | grep --quiet current
            set new_tab_cmd "zellij action rename-tab \"$tab_title\"; and cd $selected_dir; and $gfetch; and l"
        else if type -q kitty
            set new_tab_cmd "kitty @ set-tab-title \"$tab_title\"; and cd $selected_dir; and $gfetch; and l"
        else
            set new_tab_cmd "cd $selected_dir; and $gfetch; and l"
        end

        eval $new_tab_cmd

        commandline -f repaint
    end
end
