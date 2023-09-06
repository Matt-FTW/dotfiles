source ~/.config/fish/variables.fish
source ~/.config/fish/keybinds.fish

if status is-interactive
    source /usr/share/doc/find-the-command/ftc.fish
    colorscript random
end

starship init fish | source
zoxide init fish | source

alias cd='z' # Couldn't create it as a function because of zoxide init
