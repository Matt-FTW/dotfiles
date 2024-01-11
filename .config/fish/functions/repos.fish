function repos --description 'Open Git directories in ~/Repos with fzf in a new Kitty tab'
    set gfetch "gfetch -d churn contributors --no-color-palette --no-title"
    # set selected_dir (find ~/Repos -mindepth 2 -maxdepth 2 -type d -exec test -e '{}/.git' ';' -print -prune | fzf --preview "$gfetch {} && eza --long --header --icons --all --color=always --group-directories-first --hyperlink {}")
    set selected_dir (fd --exact-depth 2 . ~/Repos/ | fzf --preview "$gfetch {} && eza --long --header --icons --all --color=always --group-directories-first --hyperlink {}")

    if test -n "$selected_dir"
        set tab_title (basename "$selected_dir")
        set new_tab_cmd "kitty @ set-tab-title \"$tab_title\"; and cd $selected_dir; and $gfetch; and l"
        eval $new_tab_cmd
    end

    commandline -f repaint
end
