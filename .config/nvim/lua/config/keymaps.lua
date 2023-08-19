-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
    local keys = require("lazy.core.handler").handlers.keys
    ---@cast keys LazyKeysHandler
    -- do not create the keymap if a lazy keys handler exists
    if not keys.active[keys.parse({ lhs, mode = mode }).id] then
        opts = opts or {}
        opts.silent = opts.silent ~= false
        if opts.remap and not vim.g.vscode then
            opts.remap = nil
        end
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

map(
    "n",
    "<leader>xs",
    ":FloatermNew --disposable --name=duaroot --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<root> dua i<CR>",
    { desc = "Workspace Size (root dir)" }
)

map(
    "n",
    "<leader>xS",
    ":FloatermNew --disposable --name=duabuffer --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<buffer> dua i<CR>",
    { desc = "Workspace Size (cwd)" }
)

map(
    "n",
    "<leader>fx",
    ":FloatermNew --disposable --name=xplrroot --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<root> xplr<CR>",
    { desc = "Xplr (root dir)" }
)

map(
    "n",
    "<leader>fX",
    ":FloatermNew --disposable --name=xplrbuffer --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<buffer> xplr<CR>",
    { desc = "Xplr (cwd)" }
)

map(
    "n",
    "<leader>gg",
    ":FloatermNew --disposable --name=lazygitroot --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<root> lazygit<CR>",
    { desc = "Lazygit (root dir)" }
)

map(
    "n",
    "<leader>gG",
    ":FloatermNew --disposable --name=lazygitbuffer --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<buffer> lazygit<CR>",
    { desc = "Lazygit (cwd)" }
)

map(
    "n",
    "<leader>fd",
    ":FloatermNew --disposable --name=lazydocker --opener=edit --titleposition=center --height=0.85 --width=0.85 lazydocker<CR>",
    { desc = "Lazydocker" }
)

map("n", "<leader>t", ":Telescope floaterm<CR>", { desc = "Terminals" })
map(
    "n",
    "<leader>ft",
    ":FloatermNew --name=termroot --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<root><CR>",
    { desc = "New Terminal (root dir)" }
)
map(
    "n",
    "<leader>fT",
    ":FloatermNew --name=termcwd --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<buffer><CR>",
    { desc = "New Terminal (cwd)" }
)
map("n", "<A-Left>", "FloatermPrev<CR>", { desc = "Previous Terminal" })
map("n", "<A-Right>", "FloatermNext<CR>", { desc = "Next Terminal" })
map("n", "<c-Return>", ":FloatermToggle<CR>", { desc = "Toggle Terminal" })
map("n", "<c-/>", ":FloatermToggle<CR>", { desc = "Toggle Terminal" })

vim.keymap.set("n", "<leader>fU", vim.cmd.UndotreeToggle, { noremap = true, silent = true, desc = "Toggle Undotree" })
vim.api.nvim_set_keymap(
    "i",
    "<C-l>",
    ":lua require('neogen').jump_next<CR>",
    { noremap = true, silent = true, desc = "Next Neogen Annotation" }
)
vim.api.nvim_set_keymap(
    "i",
    "<C-h>",
    ":lua require('neogen').jump_prev<CR>",
    { noremap = true, silent = true, desc = "Prev Neogen Annotation" }
)

vim.keymap.set("n", "<C-c>", "<cmd>PickColor<cr>", { noremap = true, silent = true, desc = "Pick Color" })
vim.keymap.set("i", "<C-c>", "<cmd>PickColorInsert<cr>", { noremap = true, silent = true, desc = "Pick Color" })
