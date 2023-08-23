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

### color

- [NvChad/nvim-colorizer.lua](https://dotfyle.com/plugins/NvChad/nvim-colorizer.lua)
- [ziontee113/color-picker.nvim](https://dotfyle.com/plugins/ziontee113/color-picker.nvim)

### colorscheme

- [catppuccin/nvim](https://dotfyle.com/plugins/catppuccin/nvim)

### comment

- [danymat/neogen](https://dotfyle.com/plugins/danymat/neogen)

### completion

- [zbirenbaum/copilot.lua](https://dotfyle.com/plugins/zbirenbaum/copilot.lua)

### editing-support

- [debugloop/telescope-undo.nvim](https://dotfyle.com/plugins/debugloop/telescope-undo.nvim)
- [nvim-treesitter/nvim-treesitter-context](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter-context)
- [windwp/nvim-ts-autotag](https://dotfyle.com/plugins/windwp/nvim-ts-autotag)
- [bennypowers/nvim-regexplainer](https://dotfyle.com/plugins/bennypowers/nvim-regexplainer)

### file-explorer

- [nvim-neo-tree/neo-tree.nvim](https://dotfyle.com/plugins/nvim-neo-tree/neo-tree.nvim)

### fuzzy-finder

- [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)

### keybinding

- [folke/which-key.nvim](https://dotfyle.com/plugins/folke/which-key.nvim)

### lsp

- [simrat39/symbols-outline.nvim](https://dotfyle.com/plugins/simrat39/symbols-outline.nvim)
- [jose-elias-alvarez/null-ls.nvim](https://dotfyle.com/plugins/jose-elias-alvarez/null-ls.nvim)

### lsp-installer

- [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)

### markdown-and-latex

- [iamcco/markdown-preview.nvim](https://dotfyle.com/plugins/iamcco/markdown-preview.nvim)

### media

- [andweeb/presence.nvim](https://dotfyle.com/plugins/andweeb/presence.nvim)

### nvim-dev

- [kkharji/sqlite.lua](https://dotfyle.com/plugins/kkharji/sqlite.lua)
- [MunifTanjim/nui.nvim](https://dotfyle.com/plugins/MunifTanjim/nui.nvim)

### plugin-manager

- [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)

### preconfigured

- [LazyVim/LazyVim](https://dotfyle.com/plugins/LazyVim/LazyVim)

### project

- [natecraddock/workspaces.nvim](https://dotfyle.com/plugins/natecraddock/workspaces.nvim)

### scrollbar

- [dstein64/nvim-scrollview](https://dotfyle.com/plugins/dstein64/nvim-scrollview)

### startup

- [goolord/alpha-nvim](https://dotfyle.com/plugins/goolord/alpha-nvim)
- [echasnovski/mini.starter](https://dotfyle.com/plugins/echasnovski/mini.starter)

### syntax

- [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)

### tabline

- [akinsho/bufferline.nvim](https://dotfyle.com/plugins/akinsho/bufferline.nvim)

### utility

- [sitiom/nvim-numbertoggle](https://dotfyle.com/plugins/sitiom/nvim-numbertoggle)

## Language Servers

- marksman
- pyright
- dockerls
- gopls
- jdtls
- jsonls
- ruff_lsp
- rust_analyzer
- tailwindcss
- tsserver
- yamls
