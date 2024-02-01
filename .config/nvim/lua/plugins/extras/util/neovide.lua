if not vim.g.neovide then
  return {}
end

RefreshGuiFont = function()
  vim.opt.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)
end

ResizeGuiFont = function(delta)
  vim.g.gui_font_size = vim.g.gui_font_size + delta
  RefreshGuiFont()
end

-- Keymaps
local opts = { noremap = true, silent = true }

vim.keymap.set({ "n", "i" }, "<C-+>", function()
  ResizeGuiFont(1)
end, opts)
vim.keymap.set({ "n", "i" }, "<C-->", function()
  ResizeGuiFont(-1)
end, opts)

-- Options
vim.g.neovide_padding_top = 5
vim.g.neovide_padding_right = 5
vim.g.neovide_padding_left = 5

vim.g.neovide_window_blurred = true
vim.g.neovide_floating_blur_amount_x = 5.0
vim.g.neovide_floating_blur_amount_y = 5.0
vim.g.neovide_floating_shadow = true
vim.g.neovide_floating_z_height = 10

vim.g.neovide_cursor_antialiasing = false

vim.g.neovide_cursor_vfx_mode = "pixiedust"
vim.g.neovide_hide_mouse_when_typing = true

vim.o.guifont = "JetBrainsMono Nerd Font:h10"

vim.opt.winblend = 20
vim.g.neovide_refresh_rate = 75

return {}
