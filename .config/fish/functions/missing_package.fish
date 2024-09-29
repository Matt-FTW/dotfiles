function missing_package
    while true
        read -l -P "$argv[1] not found. Do you want to install it? [y/N] " confirm

        if test "$confirm" = y
            i $argv
            break
        else
            break
        end
    end
end
