-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Neovide options
require("config.neovide")

-- Optimizations on startup
vim.loader.enable()

-- Font
vim.g.gui_font_default_size = 10
vim.g.gui_font_size = vim.g.gui_font_default_size
vim.g.gui_font_face = "JetBrainsMono Nerd Font"

-- Define leader key
vim.g.mapleader = " "
