# dotfiles/.config/nvim

<a href="https://dotfyle.com/Matt-FTW/dotfiles-config-nvim"><img src="https://dotfyle.com/Matt-FTW/dotfiles-config-nvim/badges/plugins?style=for-the-badge" /></a>
<a href="https://dotfyle.com/Matt-FTW/dotfiles-config-nvim"><img src="https://dotfyle.com/Matt-FTW/dotfiles-config-nvim/badges/leaderkey?style=for-the-badge" /></a>
<a href="https://dotfyle.com/Matt-FTW/dotfiles-config-nvim"><img src="https://dotfyle.com/Matt-FTW/dotfiles-config-nvim/badges/plugin-manager?style=for-the-badge" /></a>

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

### colorscheme

- [catppuccin/nvim](https://dotfyle.com/plugins/catppuccin/nvim)

### completion

- [zbirenbaum/copilot.lua](https://dotfyle.com/plugins/zbirenbaum/copilot.lua)
- [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)

### debugging

- [rcarriga/nvim-dap-ui](https://dotfyle.com/plugins/rcarriga/nvim-dap-ui)
- [mfussenegger/nvim-dap](https://dotfyle.com/plugins/mfussenegger/nvim-dap)

### diagnostics

- [folke/trouble.nvim](https://dotfyle.com/plugins/folke/trouble.nvim)

### editing-support

- [nacro90/numb.nvim](https://dotfyle.com/plugins/nacro90/numb.nvim)

### file-explorer

- [kevinhwang91/rnvimr](https://dotfyle.com/plugins/kevinhwang91/rnvimr)

### fuzzy-finder

- [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)

### keybinding

- [folke/which-key.nvim](https://dotfyle.com/plugins/folke/which-key.nvim)
- [mrjones2014/legendary.nvim](https://dotfyle.com/plugins/mrjones2014/legendary.nvim)

### lsp

- [simrat39/symbols-outline.nvim](https://dotfyle.com/plugins/simrat39/symbols-outline.nvim)
- [jose-elias-alvarez/null-ls.nvim](https://dotfyle.com/plugins/jose-elias-alvarez/null-ls.nvim)
- [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
- [jose-elias-alvarez/typescript.nvim](https://dotfyle.com/plugins/jose-elias-alvarez/typescript.nvim)

### lsp-installer

- [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)

### lua-colorscheme

- [ellisonleao/gruvbox.nvim](https://dotfyle.com/plugins/ellisonleao/gruvbox.nvim)

### markdown-and-latex

- [ellisonleao/glow.nvim](https://dotfyle.com/plugins/ellisonleao/glow.nvim)

### media

- [andweeb/presence.nvim](https://dotfyle.com/plugins/andweeb/presence.nvim)

### nvim-dev

- [kkharji/sqlite.lua](https://dotfyle.com/plugins/kkharji/sqlite.lua)

### plugin-manager

- [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)

### preconfigured

- [LazyVim/LazyVim](https://dotfyle.com/plugins/LazyVim/LazyVim)

### project

- [ahmedkhalf/project.nvim](https://dotfyle.com/plugins/ahmedkhalf/project.nvim)

### scrolling

- [declancm/cinnamon.nvim](https://dotfyle.com/plugins/declancm/cinnamon.nvim)

### snippet

- [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)

### startup

- [goolord/alpha-nvim](https://dotfyle.com/plugins/goolord/alpha-nvim)

### statusline

- [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim)

### syntax

- [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)

### tabline

- [akinsho/bufferline.nvim](https://dotfyle.com/plugins/akinsho/bufferline.nvim)

### test

- [nvim-neotest/neotest](https://dotfyle.com/plugins/nvim-neotest/neotest)

## Language Servers

- cmake
- eslint
- gopls
- html
- intelephense
- jdtls
- omnisharp
- pyright
- ruff_lsp
- svelte
- taplo
