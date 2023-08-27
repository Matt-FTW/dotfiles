function repos
    set selected_dir (fd --type d --base-directory ~/Repos/ -H '^\.git$' | sed 's/\/\.git\/$//' | fzf)
    if test -n "$selected_dir"
        cd ~/Repos/"$selected_dir"
    end
end
