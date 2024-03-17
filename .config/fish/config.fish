# Uncomment the next line to enable brew
# eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv) 
starship init fish | source
zoxide init fish | source

if status is-interactive
    atuin init fish | source
    source /usr/share/doc/find-the-command/ftc.fish
end

source ~/.config/fish/user_variables.fish
source ~/.config/fish/abbreviations.fish
