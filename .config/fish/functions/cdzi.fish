function cdzi --description 'cd to a directory in the zoxide db'
    set selected_directory (zi)

    if test -n "$selected_directory"
        cd $selected_directory
    end
end
