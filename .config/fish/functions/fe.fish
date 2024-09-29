function fe
    if type -f yazi &>/dev/null
        set tmp (mktemp -t "yazi-cwd.XXXXX")
        yazi --cwd-file="$tmp"
        if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            cd -- "$cwd"
        end
        rm -f -- "$tmp"
    else
        missing_package yazi
    end
end
