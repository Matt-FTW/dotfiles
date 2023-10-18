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

### bars-and-lines

- [utilyre/barbecue.nvim](https://dotfyle.com/plugins/utilyre/barbecue.nvim)
- [SmiteshP/nvim-navic](https://dotfyle.com/plugins/SmiteshP/nvim-navic)
- [Bekaboo/dropbar.nvim](https://dotfyle.com/plugins/Bekaboo/dropbar.nvim)

### code-runner

- [stevearc/overseer.nvim](https://dotfyle.com/plugins/stevearc/overseer.nvim)
- [michaelb/sniprun](https://dotfyle.com/plugins/michaelb/sniprun)
- [Zeioth/compiler.nvim](https://dotfyle.com/plugins/Zeioth/compiler.nvim)

### color

- [NvChad/nvim-colorizer.lua](https://dotfyle.com/plugins/NvChad/nvim-colorizer.lua)
- [folke/twilight.nvim](https://dotfyle.com/plugins/folke/twilight.nvim)
- [uga-rosa/ccc.nvim](https://dotfyle.com/plugins/uga-rosa/ccc.nvim)

### colorscheme

- [catppuccin/nvim](https://dotfyle.com/plugins/catppuccin/nvim)

### comment

- [danymat/neogen](https://dotfyle.com/plugins/danymat/neogen)

### completion

- [zbirenbaum/copilot.lua](https://dotfyle.com/plugins/zbirenbaum/copilot.lua)
- [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)

### debugging

- [Weissle/persistent-breakpoints.nvim](https://dotfyle.com/plugins/Weissle/persistent-breakpoints.nvim)

### dependency-management

- [piersolenski/telescope-import.nvim](https://dotfyle.com/plugins/piersolenski/telescope-import.nvim)
- [vuki656/package-info.nvim](https://dotfyle.com/plugins/vuki656/package-info.nvim)

### editing-support

- [monaqa/dial.nvim](https://dotfyle.com/plugins/monaqa/dial.nvim)
- [debugloop/telescope-undo.nvim](https://dotfyle.com/plugins/debugloop/telescope-undo.nvim)
- [nvim-treesitter/nvim-treesitter-context](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter-context)
- [folke/zen-mode.nvim](https://dotfyle.com/plugins/folke/zen-mode.nvim)
- [HiPhish/rainbow-delimiters.nvim](https://dotfyle.com/plugins/HiPhish/rainbow-delimiters.nvim)
- [nacro90/numb.nvim](https://dotfyle.com/plugins/nacro90/numb.nvim)
- [windwp/nvim-ts-autotag](https://dotfyle.com/plugins/windwp/nvim-ts-autotag)
- [bennypowers/nvim-regexplainer](https://dotfyle.com/plugins/bennypowers/nvim-regexplainer)
- [chrisgrieser/nvim-puppeteer](https://dotfyle.com/plugins/chrisgrieser/nvim-puppeteer)

### file-explorer

- [nvim-neo-tree/neo-tree.nvim](https://dotfyle.com/plugins/nvim-neo-tree/neo-tree.nvim)

### formatting

- [echasnovski/mini.align](https://dotfyle.com/plugins/echasnovski/mini.align)
- [stevearc/conform.nvim](https://dotfyle.com/plugins/stevearc/conform.nvim)

### fuzzy-finder

- [jvgrootveld/telescope-zoxide](https://dotfyle.com/plugins/jvgrootveld/telescope-zoxide)
- [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)

### game

- [ThePrimeagen/vim-be-good](https://dotfyle.com/plugins/ThePrimeagen/vim-be-good)

### git

- [lewis6991/gitsigns.nvim](https://dotfyle.com/plugins/lewis6991/gitsigns.nvim)
- [akinsho/git-conflict.nvim](https://dotfyle.com/plugins/akinsho/git-conflict.nvim)
- [sindrets/diffview.nvim](https://dotfyle.com/plugins/sindrets/diffview.nvim)

### github

- [pwntester/octo.nvim](https://dotfyle.com/plugins/pwntester/octo.nvim)

### keybinding

- [max397574/better-escape.nvim](https://dotfyle.com/plugins/max397574/better-escape.nvim)
- [folke/which-key.nvim](https://dotfyle.com/plugins/folke/which-key.nvim)

### lsp

- [Wansmer/symbol-usage.nvim](https://dotfyle.com/plugins/Wansmer/symbol-usage.nvim)
- [aznhe21/actions-preview.nvim](https://dotfyle.com/plugins/aznhe21/actions-preview.nvim)
- [nvimtools/none-ls.nvim](https://dotfyle.com/plugins/nvimtools/none-ls.nvim)
- [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
- [mfussenegger/nvim-lint](https://dotfyle.com/plugins/mfussenegger/nvim-lint)
- [VidocqH/lsp-lens.nvim](https://dotfyle.com/plugins/VidocqH/lsp-lens.nvim)
- [hinell/lsp-timeout.nvim](https://dotfyle.com/plugins/hinell/lsp-timeout.nvim)
- [kosayoda/nvim-lightbulb](https://dotfyle.com/plugins/kosayoda/nvim-lightbulb)

### lsp-installer

- [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)

### marks

- [ThePrimeagen/harpoon](https://dotfyle.com/plugins/ThePrimeagen/harpoon)

### media

- [andweeb/presence.nvim](https://dotfyle.com/plugins/andweeb/presence.nvim)

### motion

- [folke/flash.nvim](https://dotfyle.com/plugins/folke/flash.nvim)
- [chrisgrieser/nvim-spider](https://dotfyle.com/plugins/chrisgrieser/nvim-spider)

### nvim-dev

- [anuvyklack/animation.nvim](https://dotfyle.com/plugins/anuvyklack/animation.nvim)
- [kkharji/sqlite.lua](https://dotfyle.com/plugins/kkharji/sqlite.lua)
- [MunifTanjim/nui.nvim](https://dotfyle.com/plugins/MunifTanjim/nui.nvim)
- [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)

### plugin-manager

- [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)

### preconfigured

- [LazyVim/LazyVim](https://dotfyle.com/plugins/LazyVim/LazyVim)

### scrollbar

- [lewis6991/satellite.nvim](https://dotfyle.com/plugins/lewis6991/satellite.nvim)
- [dstein64/nvim-scrollview](https://dotfyle.com/plugins/dstein64/nvim-scrollview)

### scrolling

- [declancm/cinnamon.nvim](https://dotfyle.com/plugins/declancm/cinnamon.nvim)

### snippet

- [TobinPalmer/rayso.nvim](https://dotfyle.com/plugins/TobinPalmer/rayso.nvim)

### split-and-window

- [anuvyklack/windows.nvim](https://dotfyle.com/plugins/anuvyklack/windows.nvim)
- [mrjones2014/smart-splits.nvim](https://dotfyle.com/plugins/mrjones2014/smart-splits.nvim)

### startup

- [goolord/alpha-nvim](https://dotfyle.com/plugins/goolord/alpha-nvim)

### statusline

- [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim)

### syntax

- [nvim-treesitter/nvim-treesitter-textobjects](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter-textobjects)
- [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)

### tabline

- [akinsho/bufferline.nvim](https://dotfyle.com/plugins/akinsho/bufferline.nvim)

### terminal-integration

- [akinsho/nvim-toggleterm.lua](https://dotfyle.com/plugins/akinsho/nvim-toggleterm.lua)
- [willothy/flatten.nvim](https://dotfyle.com/plugins/willothy/flatten.nvim)

### utility

- [sitiom/nvim-numbertoggle](https://dotfyle.com/plugins/sitiom/nvim-numbertoggle)
- [axieax/urlview.nvim](https://dotfyle.com/plugins/axieax/urlview.nvim)
- [luckasRanarison/nvim-devdocs](https://dotfyle.com/plugins/luckasRanarison/nvim-devdocs)
- [stevearc/dressing.nvim](https://dotfyle.com/plugins/stevearc/dressing.nvim)

### workflow

- [m4xshen/hardtime.nvim](https://dotfyle.com/plugins/m4xshen/hardtime.nvim)

## Language Servers

- eslint
- html
- omnisharp
- sqlls
- svelte
- tailwindcss
- taplo

This readme was generated by [Dotfyle](https://dotfyle.com)
