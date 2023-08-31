function rcm --description 'Git directories in ~/Repos/Community/ with fzf'
    set selected_dir (fd --type d --base-directory ~/Repos/Community/ -H '^\.git$' | sed 's/\/\.git\/$//' | fzf)
    if test -n "$selected_dir"
        cd ~/Repos/Community/"$selected_dir"
    else
        echo "No directory selected"
        return
    end
end
