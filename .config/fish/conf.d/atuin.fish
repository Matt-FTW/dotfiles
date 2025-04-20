set -x ATUIN_NOBIND true

if status is-interactive
    if type -q atuin
        atuin init fish | source
    end
end

bind \cr _atuin_search
bind up _atuin_bind_up
bind \eOA _atuin_bind_up
bind \e\[A _atuin_bind_up

if bind -M insert >/dev/null 2>&1
    bind -M insert \cr _atuin_search
    bind -M insert up _atuin_bind_up
    bind -M insert \eOA _atuin_bind_up
    bind -M insert \e\[A _atuin_bind_up
end
