function cdzi --description 'Open directories from zoxide in a new Kitty tab'
    set selected_dir (zi)

    if test -n "$selected_dir"
        cd $selected_dir
    end
end
