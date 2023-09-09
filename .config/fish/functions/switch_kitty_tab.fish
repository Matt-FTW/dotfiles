function switch_kitty_tab
    set kitty_info (kitty @ -- ls)
    set -l tabs (echo $kitty_info | jq -r '.[0].tabs[].title')
    set -l tab_ids (echo $kitty_info | jq -r '.[0].tabs[].id')

    if test -n "$tabs"
        set -l selected_tab (printf "%s\n" $tabs | fzf)

        if test -n "$selected_tab"
            kitty @ focus-tab --match "title:^$selected_tab"
        end
    else
        echo "No se encontraron pestañas de Kitty"
    end
end
