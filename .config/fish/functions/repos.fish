function repos --description 'Git directories in ~/Repos with fzf'
    set selected_dir (fd --type d --base-directory ~/Repos/ -H '^\.git$' | sed 's/\/\.git\/$//' | fzf)
    if test -n "$selected_dir"
        cd ~/Repos/"$selected_dir"
    else
        echo "No directory selected"
        return
    end
end
