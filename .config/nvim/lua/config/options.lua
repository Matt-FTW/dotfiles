-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local go = vim.g
local o = vim.opt

-- Optimizations on startup
vim.loader.enable()

-- Define leader key
go.mapleader = " "
go.maplocalleader = "\\"

-- Autoformat on save (Global)
go.autoformat = true

-- Font
go.gui_font_default_size = 10
go.gui_font_size = go.gui_font_default_size
go.gui_font_face = "JetBrainsMono Nerd Font"

-- Enable EditorConfig integration
go.editorconfig = true

-- Disable some repl providers
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
  go["loaded_" .. provider .. "_provider"] = 0
end

-- Root dir detection
go.root_spec = {
  "lsp",
  { ".git", "lua", ".obsidian", "package.json", "Makefile", "go.mod", "cargo.toml", "pyproject.toml", "src" },
  "cwd",
}

-- Show last command in the status line
o.showcmd = false
