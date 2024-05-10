function vc
    set config (fd --max-depth 1 --glob 'nvim-*' ~/.config | fzf --prompt="Neovim Configs > " --height=~50% --layout=reverse --exit-0)

    if test -z "$config"
        return
    end

    set -x NVIM_APPNAME (basename $config)
    nvim $argv
end
