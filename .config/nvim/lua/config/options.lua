-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local o = vim.g

-- Optimizations on startup
vim.loader.enable()

-- Define leader key
o.mapleader = " "
o.maplocalleader = "\\"

-- Autoformat on save (Global)
o.autoformat = true

-- Font
o.gui_font_default_size = 10
o.gui_font_size = o.gui_font_default_size
o.gui_font_face = "JetBrainsMono Nerd Font"

-- Enable EditorConfig integration
o.editorconfig = true

-- Disable some repl providers
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end
