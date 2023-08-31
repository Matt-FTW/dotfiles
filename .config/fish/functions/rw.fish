function rw --description 'Git directories in ~/Repos/Work with fzf'
    set selected_dir (fd --type d --base-directory ~/Repos/Work/ -H '^\.git$' | sed 's/\/\.git\/$//' | fzf)
    if test -n "$selected_dir"
        cd ~/Repos/Work/"$selected_dir"
    else
        echo "No directory selected"
        return
    end
end
