-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

local Util = require("lazyvim.util")

-- Search current word
local searching_brave = function()
  vim.fn.system({ "xdg-open", "https://search.brave.com/search?q=" .. vim.fn.expand("<cword>") })
end
map("n", "<leader>?", searching_brave, { noremap = true, silent = true, desc = "Search current word on brave search" })

-- Toggle background
-- stylua: ignore
map("n", "<leader>uB", function() Util.toggle("background", false, { "light", "dark" }) end, { desc = "Toggle Background" })

-- Disable lazyterminal keymap
map("n", "<leader>fT", "<Nop>")

-- End of the word backwards
map("n", "E", "ge")

-- Increment/decrement
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- Tabs
map("n", "]<tab>", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "[<tab>", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", "<leader><tab>1", "<cmd>tabn 1<cr>", { desc = "Tab 1" })
map("n", "<leader><tab>2", "<cmd>tabn 2<cr>", { desc = "Tab 2" })
map("n", "<leader><tab>3", "<cmd>tabn 3<cr>", { desc = "Tab 3" })
map("n", "<leader><tab>4", "<cmd>tabn 4<cr>", { desc = "Tab 4" })
map("n", "<leader><tab>5", "<cmd>tabn 5<cr>", { desc = "Tab 5" })
map("n", "<leader><tab>6", "<cmd>tabn 6<cr>", { desc = "Tab 6" })
map("n", "<leader><tab>7", "<cmd>tabn 7<cr>", { desc = "Tab 7" })
map("n", "<leader><tab>8", "<cmd>tabn 8<cr>", { desc = "Tab 8" })
map("n", "<leader><tab>9", "<cmd>tabn 9<cr>", { desc = "Tab 9" })

-- Buffers
map("n", "<leader>bf", "<cmd>bfirst<cr>", { desc = "First Buffer" })
map("n", "<leader>ba", "<cmd>blast<cr>", { desc = "Last Buffer" })

-- Center the screen automatically
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Toggle statusline
map("n", "<leader>uS", function()
  if vim.opt.laststatus:get() == 0 then
    vim.opt.laststatus = 3
  else
    vim.opt.laststatus = 0
  end
end, { desc = "Toggle Statusline" })

-- Plugin Info
map("n", "<leader>cif", "<cmd>LazyFormatInfo<cr>", { desc = "Formatting" })
map("n", "<leader>cic", "<cmd>ConformInfo<cr>", { desc = "Conform" })
map("n", "<leader>cir", "<cmd>LazyRoot<cr>", { desc = "Root" })
map("n", "<leader>cie", "<cmd>LazyExtras<cr>", { desc = "Extras" })

-- U for redo
map("n", "U", "<C-r>", { desc = "Redo" })

-- Move to beginning/end of line
map("n", "<a-h>", "_", { desc = "First character of Line" })
map("n", "<a-l>", "$", { desc = "Last character of Line" })

-- Copy whole text to clipboard
map("n", "<C-c>", ":%y+<CR>", { desc = "Copy whole text to clipboard", silent = true })

-- Motion
map("c", "<C-a>", "<C-b>", { desc = "Start Of Line" })
map("i", "<C-a>", "<Home>", { desc = "Start Of Line" })
map("i", "<C-e>", "<End>", { desc = "End Of Line" })

-- Select all text
map("n", "<C-a>", "gg<S-V>G", { desc = "Select all text", silent = true, noremap = true })

-- Paste options
map("i", "<C-v>", '<C-r>"', { desc = "Paste on insert mode" })
map("v", "p", '"_dP', { desc = "Paste without overwriting" })

-- Delete and change without yanking
map({ "n", "x" }, "<A-d>", '"_d', { desc = "Delete without yanking" })
map({ "n", "x" }, "<A-c>", '"_c', { desc = "Change without yanking" })

-- Deleting without yanking empty line
map("n", "dd", function()
  local is_empty_line = vim.api.nvim_get_current_line():match("^%s*$")
  if is_empty_line then
    return '"_dd'
  else
    return "dd"
  end
end, { noremap = true, expr = true, desc = "Don't yank empty line to clipboard" })

-- Search inside visually highlighted text. Use `silent = false` for it to
-- make effect immediately.
map("x", "g/", "<esc>/\\%V", { silent = false, desc = "Search inside visual selection" })

-- Search visually selected text (slightly better than builtins in Neovim>=0.8)
map("x", "*", [[y/\V<C-R>=escape(@", '/\')<CR><CR>]])
map("x", "#", [[y?\V<C-R>=escape(@", '?\')<CR><CR>]])
