set -xg EDITOR nvim
set -xg VISUAL nvim
set -xg XDG_CONFIG_HOME ~/.config
set -xg XDG_CACHE_HOME ~/.cache
set -xg XDG_DATA_HOME ~/.local/share
set -xg XDG_RUNTIME_DIR ~/.local/run
set -xg XDG_BIN_HOME ~/.local/bin
set -xg XDG_SCRIPT_HOME ~/.local/script
set -xg LANG es_ES.UTF-8
set -xg LC_ALL es_ES.UTF-8

if status is-interactive
    # Commands to run in interactive sessions can go here
    set -x FZF_DEFAULT_OPTS "\
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"
    set -xg LS_COLORS (vivid generate catppuccin-macchiato)

    set fzf_preview_dir_cmd exa --all --color=always
    fzf_configure_bindings --directory=\cf

    source ~/.config/fish/functions/fzf_git.fish

    colorscript random
end

starship init fish | source
zoxide init fish | source

source ~/.config/fish/aliases.fish
