function cdzc --description 'Open directories from zoxide in vscode'
    set selected_dir (zi)

    if test -n "$selected_dir"
        cd "$selected_dir"
        codium -r .
    else
        commandline -f repaint
    end
end
