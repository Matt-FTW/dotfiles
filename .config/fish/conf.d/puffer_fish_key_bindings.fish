status is-interactive || exit

function _puffer_fish_key_bindings --on-variable fish_key_bindings
    set -l modes
    if test "$fish_key_bindings" = fish_default_key_bindings
        set modes default insert
    else
        set modes insert default
    end

    bind --mode $modes[1] . _puffer_fish_expand_dots
    bind --mode $modes[1] ! _puffer_fish_expand_bang
    bind --mode $modes[1] '$' _puffer_fish_expand_lastarg
    bind --mode $modes[2] --erase . ! '$'
end

_puffer_fish_key_bindings

set -l uninstall_event puffer_fish_key_bindings_uninstall

function _$uninstall_event --on-event $uninstall_event
    bind -e .
    bind -e !
    bind -e '$'
end
