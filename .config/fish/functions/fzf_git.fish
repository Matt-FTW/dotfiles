function repos
    set selected_dir (find ~/Repos/ -type d -name '.git' -prune | sed 's/\/\.git$//' | sed 's/^\.\///' | fzf)
    if test -n "$selected_dir"
        cd "$selected_dir"
        vim .
    end
end
