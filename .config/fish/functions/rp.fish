function rp --description 'Git directories in ~/Repos/Personal/ with fzf'
    set selected_dir (fd --type d --base-directory ~/Repos/Personal/ -H '^\.git$' | sed 's/\/\.git\/$//' | fzf)
    if test -n "$selected_dir"
        cd ~/Repos/Personal/"$selected_dir"
    else
        echo "No directory selected"
        return
    end
end
