-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.gui_font_default_size = 10
vim.g.gui_font_size = vim.g.gui_font_default_size
vim.g.gui_font_face = "JetBrainsMono Nerd Font"

RefreshGuiFont = function()
    vim.opt.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)
end

ResizeGuiFont = function(delta)
    vim.g.gui_font_size = vim.g.gui_font_size + delta
    RefreshGuiFont()
end

ResetGuiFont = function()
    vim.g.gui_font_size = vim.g.gui_font_default_size
    RefreshGuiFont()
end

-- Call function on startup to set default value
ResetGuiFont()

-- Keymaps

local opts = { noremap = true, silent = true }

vim.keymap.set({ 'n', 'i' }, "<C-+>", function() ResizeGuiFont(1) end, opts)
vim.keymap.set({ 'n', 'i' }, "<C-->", function() ResizeGuiFont(-1) end, opts)
vim.keymap.set({ 'n', 'i' }, "<C-BS>", function() ResetGuiFont() end, opts)

if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
    vim.g.neovide_padding_top = 10
    vim.g.neovide_padding_right = 10
    vim.g.neovide_padding_left = 10

    vim.g.neovide_floating_blur_amount_x = 5.0
    vim.g.neovide_floating_blur_amount_y = 5.0

    vim.g.neovide_transparency = 0.85

    vim.g.neovide_cursor_antialiasing = false

    vim.g.neovide_cursor_vfx_mode = "pixiedust"

    vim.opt.winblend = 20
end

vim.opt.relativenumber = false
