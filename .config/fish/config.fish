if status is-interactive
    # Commands to run in interactive sessions can go here
    zoxide init fish | source
    . ~/.config/fish/aliases.fish
    neofetch
end

starship init fish | source