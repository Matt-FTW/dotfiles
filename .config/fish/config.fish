source ~/.config/fish/variables.fish
source ~/.config/fish/abbreviations.fish

if status is-interactive
    atuin init fish | source
    source /usr/share/doc/find-the-command/ftc.fish
    colorscript random
end

starship init fish | source
zoxide init fish | source
