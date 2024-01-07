-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.g

-- Optimizations on startup
vim.loader.enable()

-- Font
opt.gui_font_default_size = 10
opt.gui_font_size = opt.gui_font_default_size
opt.gui_font_face = "JetBrainsMono Nerd Font"

-- Define leader key
opt.mapleader = " "

-- Enable EditorConfig integration
opt.editorconfig = true
