#source ~/.config/fish/variables.fish

if status is-interactive
    # Commands to run in interactive sessions can go here
    set -x FZF_DEFAULT_OPTS "\
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"
    set -xg LS_COLORS (vivid generate catppuccin-macchiato)
    set -xg BAT_THEME Catppuccin-macchiato

    set fzf_preview_dir_cmd exa --all --color=always
    fzf_configure_bindings --directory=\cf

    source ~/.config/fish/functions/fzf_git.fish
    source ~/.config/fish/functions/fzf_git_all.fish

    colorscript random
end

starship init fish | source
zoxide init fish | source
navi widget fish | source

source ~/.config/fish/aliases.fish
