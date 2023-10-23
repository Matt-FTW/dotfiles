-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
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

vim.keymap.set("n", "<leader>?", function()
  google(vim.fn.expand("<cWORD>"), false)
end, { desc = "Google" })

vim.keymap.set("x", "<leader>?", function()
  google(vim.fn.getreg("g"), false)
end, { desc = "Google" })

if vim.lsp.inlay_hint then
  vim.keymap.set("n", "<leader>uh", function()
    vim.lsp.inlay_hint(0, nil)
  end, { desc = "Toggle Inlay Hints" })
end

vim.keymap.set("n", "<leader>ft", "<Nop>")
vim.keymap.set("n", "<leader>fT", "<Nop>")

vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")

vim.keymap.set("n", "N", "Nzzzv")

-- DEFAULT_KEYMAPS:

-- Half-window movements:
vim.keymap.set({ "n", "x" }, "<C-u>", "<Cmd>lua Scroll('<C-u>', 1, 1)<CR>")
vim.keymap.set({ "n", "x" }, "<C-d>", "<Cmd>lua Scroll('<C-d>', 1, 1)<CR>")

-- Page movements:
vim.keymap.set({ "n", "x" }, "<C-b>", "<Cmd>lua Scroll('<C-b>', 1, 1)<CR>")
vim.keymap.set({ "n", "x" }, "<C-f>", "<Cmd>lua Scroll('<C-f>', 1, 1)<CR>")
vim.keymap.set({ "n", "x" }, "<PageUp>", "<Cmd>lua Scroll('<C-b>', 1, 1)<CR>")
vim.keymap.set({ "n", "x" }, "<PageDown>", "<Cmd>lua Scroll('<C-f>', 1, 1)<CR>")

-- EXTRA_KEYMAPS:

-- Start/end of file and line number movements:
vim.keymap.set({ "n", "x" }, "gg", "<Cmd>lua Scroll('gg')<CR>")
vim.keymap.set({ "n", "x" }, "G", "<Cmd>lua Scroll('G', 0, 1)<CR>")

-- Start/end of line:
vim.keymap.set({ "n", "x" }, "0", "<Cmd>lua Scroll('0')<CR>")
vim.keymap.set({ "n", "x" }, "^", "<Cmd>lua Scroll('^')<CR>")
vim.keymap.set({ "n", "x" }, "$", "<Cmd>lua Scroll('$', 0, 1)<CR>")

-- Paragraph movements:
vim.keymap.set({ "n", "x" }, "{", "<Cmd>lua Scroll('{')<CR>")
vim.keymap.set({ "n", "x" }, "}", "<Cmd>lua Scroll('}')<CR>")

-- Previous/next search result:
vim.keymap.set("n", "n", "<Cmd>lua Scroll('n', 1)<CR>")
vim.keymap.set("n", "N", "<Cmd>lua Scroll('N', 1)<CR>")
vim.keymap.set("n", "*", "<Cmd>lua Scroll('*', 1)<CR>")
vim.keymap.set("n", "#", "<Cmd>lua Scroll('#', 1)<CR>")
vim.keymap.set("n", "g*", "<Cmd>lua Scroll('g*', 1)<CR>")
vim.keymap.set("n", "g#", "<Cmd>lua Scroll('g#', 1)<CR>")

-- Previous/next cursor location:
vim.keymap.set("n", "<C-o>", "<Cmd>lua Scroll('<C-o>', 1)<CR>")
vim.keymap.set("n", "<C-i>", "<Cmd>lua Scroll('1<C-i>', 1)<CR>")

-- Screen scrolling:
vim.keymap.set("n", "zz", "<Cmd>lua Scroll('zz', 0, 1)<CR>")
vim.keymap.set("n", "zt", "<Cmd>lua Scroll('zt', 0, 1)<CR>")
vim.keymap.set("n", "zb", "<Cmd>lua Scroll('zb', 0, 1)<CR>")
vim.keymap.set("n", "z.", "<Cmd>lua Scroll('z.', 0, 1)<CR>")
vim.keymap.set("n", "z<CR>", "<Cmd>lua Scroll('zt^', 0, 1)<CR>")
vim.keymap.set("n", "z-", "<Cmd>lua Scroll('z-', 0, 1)<CR>")
vim.keymap.set("n", "z^", "<Cmd>lua Scroll('z^', 0, 1)<CR>")
vim.keymap.set("n", "z+", "<Cmd>lua Scroll('z+', 0, 1)<CR>")
vim.keymap.set("n", "<C-y>", "<Cmd>lua Scroll('<C-y>', 0, 1)<CR>")
vim.keymap.set("n", "<C-e>", "<Cmd>lua Scroll('<C-e>', 0, 1)<CR>")

-- Horizontal screen scrolling:
vim.keymap.set("n", "zH", "<Cmd>lua Scroll('zH')<CR>")
vim.keymap.set("n", "zL", "<Cmd>lua Scroll('zL')<CR>")
vim.keymap.set("n", "zs", "<Cmd>lua Scroll('zs')<CR>")
vim.keymap.set("n", "ze", "<Cmd>lua Scroll('ze')<CR>")
vim.keymap.set("n", "zh", "<Cmd>lua Scroll('zh', 0, 1)<CR>")
vim.keymap.set("n", "zl", "<Cmd>lua Scroll('zl', 0, 1)<CR>")

-- EXTENDED_KEYMAPS:

-- Up/down movements:
vim.keymap.set({ "n", "x" }, "k", "<Cmd>lua Scroll('k', 0, 1)<CR>")
vim.keymap.set({ "n", "x" }, "j", "<Cmd>lua Scroll('j', 0, 1)<CR>")
vim.keymap.set({ "n", "x" }, "<Up>", "<Cmd>lua Scroll('k', 0, 1)<CR>")
vim.keymap.set({ "n", "x" }, "<Down>", "<Cmd>lua Scroll('j', 0, 1)<CR>")

-- Left/right movements:
vim.keymap.set({ "n", "x" }, "h", "<Cmd>lua Scroll('h', 0, 1)<CR>")
vim.keymap.set({ "n", "x" }, "l", "<Cmd>lua Scroll('l', 0, 1)<CR>")
vim.keymap.set({ "n", "x" }, "<Left>", "<Cmd>lua Scroll('h', 0, 1)<CR>")
vim.keymap.set({ "n", "x" }, "<Right>", "<Cmd>lua Scroll('l', 0, 1)<CR>")

-- LSP_KEYMAPS:

-- LSP go-to-definition:
vim.keymap.set("n", "gd", "<Cmd>lua Scroll('definition')<CR>")

-- LSP go-to-declaration:
vim.keymap.set("n", "gD", "<Cmd>lua Scroll('declaration')<CR>")

vim.keymap.set("n", "<M-BS>", "<Cmd>noh<CR>", { noremap = true, silent = true, desc = "Clear Search" })
