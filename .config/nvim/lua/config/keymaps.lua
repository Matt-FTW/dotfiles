-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
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

map("n", "<leader>T", ":Telescope floaterm<CR>", { desc = "Terminals" })

map("n", "<leader>sz", ":Telescope zoxide list<CR>", { desc = "Zoxide" })

map("n", "<leader>sL", ":Telescope luasnip<CR>", { desc = "Snippets (Luasnip)" })

map("n", "<leader>sp", ":Telescope lazy<CR>", { desc = "Plugins (Lazy)" })

map("n", "<leader>si", ":Telescope import<CR>", { desc = "Imports" })

map("n", "<leader>sI", ":Gitignore<CR>", { desc = "Gitignore" })

map("n", "<leader>um", ":MarkdownPreviewToggle<CR>", { desc = "Toggle Markdown Preview" })

map("n", "<leader>cn", ":NullLsInfo<CR>", { desc = "NullLs Info" })

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
map("n", "<c-Return>", ":FloatermToggle<CR>", { desc = "Toggle Terminal" })
map("t", "<C-Return>", "<C-\\><C-n><C-\\><C-n>:FloatermToggle<CR>", { desc = "Toggle Terminal", nowait = true })

vim.keymap.set("n", "<leader>gU", vim.cmd.UndotreeToggle, { noremap = true, silent = true, desc = "Toggle Undotree" })

vim.keymap.set("n", "<C-c>", "<cmd>PickColor<cr>", { noremap = true, silent = true, desc = "Pick Color" })
vim.keymap.set("i", "<C-c>", "<cmd>PickColorInsert<cr>", { noremap = true, silent = true, desc = "Pick Color" })

-- Open compiler
vim.keymap.set("n", "<leader>ccc", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true, desc = "Open Compiler" })

vim.keymap.set("n", "<leader>ccR", function()
    vim.cmd("CompilerStop")
    vim.cmd("CompilerRedo")
end, { noremap = true, silent = true, desc = "Redo Compiler" })

-- Toggle compiler results
vim.keymap.set(
    "n",
    "<leader>ccr",
    "<cmd>CompilerToggleResults<cr>",
    { noremap = true, silent = true, desc = "Toggle Compiler Results" }
)

vim.api.nvim_set_keymap(
    "n",
    "<leader>cps",
    "<cmd>lua require('package-info').show({ force = true })<cr>",
    { silent = true, noremap = true, desc = "Show Package Versions" }
)

vim.api.nvim_set_keymap(
    "n",
    "<leader>cpu",
    "<cmd>lua require('package-info').update()<cr>",
    { silent = true, noremap = true, desc = "Update Package" }
)

vim.api.nvim_set_keymap(
    "n",
    "<leader>cpr",
    "<cmd>lua require('package-info').delete()<cr>",
    { silent = true, noremap = true, desc = "Remove Package" }
)

vim.api.nvim_set_keymap(
    "n",
    "<leader>cpv",
    "<cmd>lua require('package-info').change_version()<cr>",
    { silent = true, noremap = true, desc = "Change Package Version" }
)

vim.api.nvim_set_keymap(
    "n",
    "<leader>cpn",
    "<cmd>lua require('package-info').install()<cr>",
    { silent = true, noremap = true, desc = "Install New Dependency" }
)

vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")

vim.keymap.set("n", "N", "Nzzzv")

local function goto_prev_node()
    local ts_utils = require("nvim-treesitter.ts_utils")
    local node = ts_utils.get_node_at_cursor()
    if not node then
        return
    end
    local dest_node = ts_utils.get_previous_node(node, true, true)
    if not dest_node then
        local cur_node = node:parent()
        while cur_node do
            dest_node = ts_utils.get_previous_node(cur_node, false, false)
            if dest_node then
                break
            end
            cur_node = cur_node:parent()
        end
    end
    if not dest_node then
        return
    end
    ts_utils.goto_node(dest_node)
end

local function goto_next_node()
    local ts_utils = require("nvim-treesitter.ts_utils")
    local node = ts_utils.get_node_at_cursor()
    if not node then
        return
    end
    local dest_node = ts_utils.get_next_node(node, true, true)
    if not dest_node then
        local cur_node = node:parent()
        while cur_node do
            dest_node = ts_utils.get_next_node(cur_node, false, false)
            if dest_node then
                break
            end
            cur_node = cur_node:parent()
        end
    end
    if not dest_node then
        return
    end
    ts_utils.goto_node(dest_node)
end

local function goto_parent_node()
    local ts_utils = require("nvim-treesitter.ts_utils")
    local node = ts_utils.get_node_at_cursor()
    if not node then
        return
    end
    local dest_node = node:parent()
    if not dest_node then
        return
    end
    ts_utils.goto_node(dest_node)
end

local function goto_child_node()
    local ts_utils = require("nvim-treesitter.ts_utils")
    local node = ts_utils.get_node_at_cursor()
    if not node then
        return
    end
    local dest_node = ts_utils.get_named_children(node)[1]
    if not dest_node then
        return
    end
    ts_utils.goto_node(dest_node)
end

local keyopts = { noremap = true, silent = true }

vim.keymap.set({ "n", "v", "o", "i" }, "<C-M-o>", goto_parent_node, keyopts)
vim.keymap.set({ "n", "v", "o", "i" }, "<C-M-i>", goto_child_node, keyopts)
vim.keymap.set({ "n", "v", "o", "i" }, "<C-M-n>", goto_next_node, keyopts)
vim.keymap.set({ "n", "v", "o", "i" }, "<C-M-p>", goto_prev_node, keyopts)

vim.keymap.set({ "n", "v", "o", "i" }, "<C-M-h>", goto_parent_node, keyopts)
vim.keymap.set({ "n", "v", "o", "i" }, "<C-M-l>", goto_child_node, keyopts)
vim.keymap.set({ "n", "v", "o", "i" }, "<C-M-j>", goto_next_node, keyopts)
vim.keymap.set({ "n", "v", "o", "i" }, "<C-M-k>", goto_prev_node, keyopts)

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

vim.keymap.set("n", "<M-BS>", "<Cmd>noh<CR>", { noremap = true, silent = true, desc = "Clear Search" })

vim.keymap.set("n", "]b", require("goto-breakpoints").next, { desc = "Next Breakpoint" })
vim.keymap.set("n", "[b", require("goto-breakpoints").prev, { desc = "Prev Breakpoint" })
vim.keymap.set("n", "<leader>dbn", require("goto-breakpoints").next, { desc = "Next Breakpoint" })
vim.keymap.set("n", "<leader>dbp", require("goto-breakpoints").prev, { desc = "Prev Breakpoint" })
vim.keymap.set("n", "<leader>dbs", require("goto-breakpoints").stopped, { desc = "Stopped Breakpoint" })

-- vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
-- vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
-- vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
-- vim.keymap.set({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })
