function allrepos
    set -l search_directories ~/Descargas/ /docs/Documentos/ ~/.config/ ~/.local/share/
    set -l excluded_directory /docs/Documentos/Repos/
    set -l selected_dir (find $search_directories -type d -name '.git' -not -path "$excluded_directory/*" -exec dirname '{}' \; | fzf)

    if test -n "$selected_dir"
        cd "$selected_dir"
        vim .
    end
end
