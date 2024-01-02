-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local Util = require("lazyvim.util")

-- Search current word
local searching_brave =
  [[:lua vim.fn.system({'xdg-open', 'https://search.brave.com/search?q=' .. vim.fn.expand("<cword>")})<CR>]]
map("n", "<leader>?", searching_brave, { noremap = true, silent = true, desc = "Search current word on brave search" })

-- Toggle background
map("n", "<leader>uB", function()
  Util.toggle("background", false, { "light", "dark" })
end, { desc = "Toggle Background" })

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

-- Buffers
map("n", "<leader>bf", "<cmd>bfirst<cr>", { desc = "First Buffer" })
map("n", "<leader>ba", "<cmd>blast<cr>", { desc = "Last Buffer" })

-- Center the screen automatically
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
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

-- Select all text
map("n", "<C-a>", "gg<S-V>G", { desc = "Select all text", silent = true, noremap = true })

-- Paste options
map("i", "<C-v>", '<C-r>"', { desc = "Paste on insert mode" })
map("v", "p", '"_dP', { desc = "Paste without overwriting" })

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

if package.loaded["cinnamon"] then
  -- DEFAULT_KEYMAPS:

  -- Half-window movements:
  map({ "n", "x" }, "<C-u>", "<Cmd>lua Scroll('<C-u>', 1, 1)<CR>")
  map({ "n", "x" }, "<C-d>", "<Cmd>lua Scroll('<C-d>', 1, 1)<CR>")

  -- Page movements:
  map({ "n", "x" }, "<C-b>", "<Cmd>lua Scroll('<C-b>', 1, 1)<CR>")
  map({ "n", "x" }, "<C-f>", "<Cmd>lua Scroll('<C-f>', 1, 1)<CR>")
  map({ "n", "x" }, "<PageUp>", "<Cmd>lua Scroll('<C-b>', 1, 1)<CR>")
  map({ "n", "x" }, "<PageDown>", "<Cmd>lua Scroll('<C-f>', 1, 1)<CR>")

  -- EXTRA_KEYMAPS:

  -- Start/end of file and line number movements:
  map({ "n", "x" }, "gg", "<Cmd>lua Scroll('gg')<CR>")
  map({ "n", "x" }, "G", "<Cmd>lua Scroll('G', 0, 1)<CR>")

  -- Start/end of line:
  map({ "n", "x" }, "0", "<Cmd>lua Scroll('0')<CR>")
  map({ "n", "x" }, "^", "<Cmd>lua Scroll('^')<CR>")
  map({ "n", "x" }, "$", "<Cmd>lua Scroll('$', 0, 1)<CR>")

  -- Paragraph movements:
  map({ "n", "x" }, "{", "<Cmd>lua Scroll('{')<CR>")
  map({ "n", "x" }, "}", "<Cmd>lua Scroll('}')<CR>")

  -- Previous/next search result:
  map("n", "n", "<Cmd>lua Scroll('n', 1)<CR>")
  map("n", "N", "<Cmd>lua Scroll('N', 1)<CR>")
  map("n", "*", "<Cmd>lua Scroll('*', 1)<CR>")
  map("n", "#", "<Cmd>lua Scroll('#', 1)<CR>")
  map("n", "g*", "<Cmd>lua Scroll('g*', 1)<CR>")
  map("n", "g#", "<Cmd>lua Scroll('g#', 1)<CR>")

  -- Previous/next cursor location:
  map("n", "<C-o>", "<Cmd>lua Scroll('<C-o>', 1)<CR>")
  map("n", "<C-i>", "<Cmd>lua Scroll('1<C-i>', 1)<CR>")

  -- Screen scrolling:
  map("n", "zz", "<Cmd>lua Scroll('zz', 0, 1)<CR>")
  map("n", "zt", "<Cmd>lua Scroll('zt', 0, 1)<CR>")
  map("n", "zb", "<Cmd>lua Scroll('zb', 0, 1)<CR>")
  map("n", "z.", "<Cmd>lua Scroll('z.', 0, 1)<CR>")
  map("n", "z<CR>", "<Cmd>lua Scroll('zt^', 0, 1)<CR>")
  map("n", "z-", "<Cmd>lua Scroll('z-', 0, 1)<CR>")
  map("n", "z^", "<Cmd>lua Scroll('z^', 0, 1)<CR>")
  map("n", "z+", "<Cmd>lua Scroll('z+', 0, 1)<CR>")
  map("n", "<C-y>", "<Cmd>lua Scroll('<C-y>', 0, 1)<CR>")
  map("n", "<C-e>", "<Cmd>lua Scroll('<C-e>', 0, 1)<CR>")

  -- Horizontal screen scrolling:
  map("n", "zH", "<Cmd>lua Scroll('zH')<CR>")
  map("n", "zL", "<Cmd>lua Scroll('zL')<CR>")
  map("n", "zs", "<Cmd>lua Scroll('zs')<CR>")
  map("n", "ze", "<Cmd>lua Scroll('ze')<CR>")
  map("n", "zh", "<Cmd>lua Scroll('zh', 0, 1)<CR>")
  map("n", "zl", "<Cmd>lua Scroll('zl', 0, 1)<CR>")

  -- EXTENDED_KEYMAPS:

  -- Up/down movements:
  map({ "n", "x" }, "k", "<Cmd>lua Scroll('k', 0, 1)<CR>")
  map({ "n", "x" }, "j", "<Cmd>lua Scroll('j', 0, 1)<CR>")
  map({ "n", "x" }, "<Up>", "<Cmd>lua Scroll('k', 0, 1)<CR>")
  map({ "n", "x" }, "<Down>", "<Cmd>lua Scroll('j', 0, 1)<CR>")

  -- Left/right movements:
  map({ "n", "x" }, "h", "<Cmd>lua Scroll('h', 0, 1)<CR>")
  map({ "n", "x" }, "l", "<Cmd>lua Scroll('l', 0, 1)<CR>")
  map({ "n", "x" }, "<Left>", "<Cmd>lua Scroll('h', 0, 1)<CR>")
  map({ "n", "x" }, "<Right>", "<Cmd>lua Scroll('l', 0, 1)<CR>")

  -- LSP_KEYMAPS:

  -- LSP go-to-definition:
  map("n", "gd", "<Cmd>lua Scroll('definition')<CR>")

  -- LSP go-to-declaration:
  map("n", "gD", "<Cmd>lua Scroll('declaration')<CR>")
end
