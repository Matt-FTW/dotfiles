function cdzi
    # Ejecuta zi y utilize su interfaz de fzf para seleccionar el directorio
    set selected_directory (zi)

    # Si se seleccionó un directorio, navega a él
    if test -n "$selected_directory"
        cd $selected_directory
    end
end
