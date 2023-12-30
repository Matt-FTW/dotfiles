if not vim.g.neovide then
  return
end

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

vim.keymap.set({ "n", "i" }, "<C-+>", function()
  ResizeGuiFont(1)
end, opts)
vim.keymap.set({ "n", "i" }, "<C-->", function()
  ResizeGuiFont(-1)
end, opts)
vim.keymap.set({ "n", "i" }, "<C-BS>", function()
  ResetGuiFont()
end, opts)

vim.g.neovide_padding_top = 5
vim.g.neovide_padding_right = 5
vim.g.neovide_padding_left = 5

vim.g.neovide_floating_blur_amount_x = 5.0
vim.g.neovide_floating_blur_amount_y = 5.0

vim.g.neovide_transparency = 0.85

vim.g.neovide_cursor_antialiasing = false

vim.g.neovide_cursor_vfx_mode = "pixiedust"

vim.opt.winblend = 20

if vim.fn.exists("g:terminal_color_0") == 0 then
  vim.api.nvim_set_var("terminal_color_0", "#494D64")
  vim.api.nvim_set_var("terminal_color_1", "#ED8796")
  vim.api.nvim_set_var("terminal_color_2", "#A6DA95")
  vim.api.nvim_set_var("terminal_color_3", "#EED49F")
  vim.api.nvim_set_var("terminal_color_4", "#8AADF4")
  vim.api.nvim_set_var("terminal_color_5", "#F5BDE6")
  vim.api.nvim_set_var("terminal_color_6", "#8BD5CA")
  vim.api.nvim_set_var("terminal_color_7", "#B8C0E0")
  vim.api.nvim_set_var("terminal_color_8", "#5B6078")
  vim.api.nvim_set_var("terminal_color_9", "#ED8796")
  vim.api.nvim_set_var("terminal_color_10", "#A6DA95")
  vim.api.nvim_set_var("terminal_color_11", "#EED49F")
  vim.api.nvim_set_var("terminal_color_12", "#8AADF4")
  vim.api.nvim_set_var("terminal_color_13", "#F5BDE6")
  vim.api.nvim_set_var("terminal_color_14", "#8BD5CA")
  vim.api.nvim_set_var("terminal_color_15", "#B8C0E0")
end

vim.g.neovide_theme = "catppuccin-macchiato"
