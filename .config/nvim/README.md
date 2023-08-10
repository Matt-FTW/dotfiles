# dotfiles/.config/nvim

<a href="https://dotfyle.com/Matt-FTW/dotfiles-config-nvim"><img src="https://dotfyle.com/Matt-FTW/dotfiles-config-nvim/badges/plugins?style=for-the-badge" /></a>
<a href="https://dotfyle.com/Matt-FTW/dotfiles-config-nvim"><img src="https://dotfyle.com/Matt-FTW/dotfiles-config-nvim/badges/leaderkey?style=for-the-badge" /></a>
<a href="https://dotfyle.com/Matt-FTW/dotfiles-config-nvim"><img src="https://dotfyle.com/Matt-FTW/dotfiles-config-nvim/badges/plugin-manager?style=for-the-badge" /></a>

Using **LazyGit** as a startup config.

## Install Instructions

> Install requires Neovim 0.9+. Always review the code before installing a configuration.

Clone the repository and install the plugins:

```sh
git clone git@github.com:Matt-FTW/dotfiles ~/.config/Matt-FTW/dotfiles
NVIM_APPNAME=Matt-FTW/dotfiles/.config/nvim nvim --headless +"Lazy! sync" +qa
```

Open Neovim with this config:

```sh
NVIM_APPNAME=Matt-FTW/dotfiles/.config/nvim nvim
```

## Plugins

### color

- [NvChad/nvim-colorizer.lua](https://dotfyle.com/plugins/NvChad/nvim-colorizer.lua)

### completion

- [zbirenbaum/copilot.lua](https://dotfyle.com/plugins/zbirenbaum/copilot.lua)

### lsp

- [jose-elias-alvarez/null-ls.nvim](https://dotfyle.com/plugins/jose-elias-alvarez/null-ls.nvim)

### lsp-installer

- [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)

### markdown-and-latex

- [ellisonleao/glow.nvim](https://dotfyle.com/plugins/ellisonleao/glow.nvim)

### media

- [andweeb/presence.nvim](https://dotfyle.com/plugins/andweeb/presence.nvim)

### plugin-manager

- [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)

- [LazyVim/LazyVim](https://dotfyle.com/plugins/LazyVim/LazyVim)

### syntax

- [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)

## Language Servers

- svelte
- python
