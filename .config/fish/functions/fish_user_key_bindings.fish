function fish_user_key_bindings
    set -xg fish_key_bindings fish_vi_key_bindings
    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase insert
    bind -M visual -m default y 'fish_clipboard_copy; commandline -f end-selection repaint-mode'
    bind yy fish_clipboard_copy
    bind p fish_clipboard_paste

    fzf_configure_bindings --directory=\e\cf --history=\ch --variables=\e\cv

    bind \e\cg fgit
    bind \e\cw rga-fzf
    bind \e\z cdzi
    bind \e\cn navi
    bind \e\cr repos
    bind \e\[Z switch_kitty_tab
    bind \e\ce fe
end
