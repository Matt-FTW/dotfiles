if status is-interactive
    # Commands to run in interactive sessions can go here
    neofetch
    zoxide init fish | source
end

alias code='vscodium'
alias ls='exa --long --header -a --icons'
alias tree='exa --long --header -a --icons --tree'
alias bruh='genact -s 4'
alias matrix='unimatrix'
alias q='exit'
alias install='sudo pacman -S '
alias uninstall='sudo pacman -R '
alias yinstall='yay -S '
alias yuninstall='yay -R '
alias update='sudo pacman -Syu'
alias yupdate='yay -Syu'
alias search='pacseek'
alias gpt='tgpt'
alias clock='tty-clock -sbc'
alias files='xplr'
alias sysproc='sysz'
alias cat='bat'
alias dots='yadm enter lazygit'
alias audiorestart='systemctl --user restart wireplumber pipewire pipewire-pulse'
alias info='tldr'
alias cd='z'
alias disks='duf'
