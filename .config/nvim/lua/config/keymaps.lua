-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local Util = require("lazyvim.util")

--  ╭───────────────────────────────────────────────────────────╮
--  │ Credit: June Gunn <Leader>?/! | Google it / Feeling lucky │
--  ╰───────────────────────────────────────────────────────────╯

vim.g.open_command = vim.g.open_command or "xdg-open"
---@param pat string
---@param lucky boolean
local function google(pat, lucky)
  local query = '"' .. vim.fn.substitute(pat, '["\n]', " ", "g") .. '"'
  query = vim.fn.substitute(query, "[[:punct:] ]", [[\=printf("%%%02X", char2nr(submatch(0)))]], "g")
  vim.fn.system(
    vim.fn.printf(vim.g.open_command .. ' "https://www.google.com/search?%sq=%s"', lucky and "btnI&" or "", query)
  )
end

map("n", "<leader>?", function()
  google(vim.fn.expand("<cWORD>"), false)
end, { desc = "Google" })

map("x", "<leader>?", function()
  google(vim.fn.getreg("g"), false)
end, { desc = "Google" })

map("n", "<leader>uB", function()
  Util.toggle("background", false, { "light", "dark" })
end, { desc = "Toggle Background" })

map("n", "<leader>fT", "<Nop>")

map("n", "<C-d>", "<C-d>zz")

map("n", "<C-u>", "<C-u>zz")

map("n", "n", "nzzzv")

map("n", "N", "Nzzzv")

map("n", "<leader>uS", function()
  if vim.opt.laststatus:get() == 0 then
    vim.opt.laststatus = 3
  else
    vim.opt.laststatus = 0
  end
end, { desc = "Toggle Statusline" })

map("n", "<leader>cif", "<cmd>LazyFormatInfo<cr>", { desc = "Formatting" })
map("n", "<leader>cir", "<cmd>LazyRoot<cr>", { desc = "Root" })
map("n", "<leader>cie", "<cmd>LazyExtras<cr>", { desc = "Extras" })

map("n", "<c-,>", "_", { desc = "First character of Line" })
map("n", "<c-.>", "$", { desc = "Last character of Line" })

-- Copy whole text to clipboard
map("n", "<C-c>", ":%y+<CR>")

-- Select all text
map("n", "<C-n>", "gg<S-V>G")

-- Better paste
-- remap "p" in visual mode to delete the highlighted text without overwriting your yanked/copied text, and then paste the content from the unnamed register.
map("v", "p", '"_dP')

map("n", "dd", function()
  local is_empty_line = vim.api.nvim_get_current_line():match("^%s*$")
  if is_empty_line then
    return '"_dd'
  else
    return "dd"
  end
end, { noremap = true, expr = true, desc = "Don't yank empty line to clipboard" })

map("n", "gV", '"`[" . strpart(getregtype(), 0, 1) . "`]"', { expr = true, desc = "Visually select changed text" })

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
