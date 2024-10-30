function fish_user_key_bindings
    set -xg fish_key_bindings fish_vi_key_bindings
    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase insert
    bind -M visual -m default y 'fish_clipboard_copy; commandline -f end-selection repaint-mode'
    bind yy fish_clipboard_copy
    bind p fish_clipboard_paste
    for dir in ~/.config/fish/functions
        if test -f "$dir/fzf_configure_bindings.fish"
            fzf_configure_bindings --directory=\e\cf --history=\ch --variables=\e\cv
            break
        end
    end

    bind -M insert \e\z zi
end
