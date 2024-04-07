if status is-interactive
    if type atuin >/dev/null ^&1
        atuin init fish | source
    end
end
