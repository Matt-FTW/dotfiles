vim.keymap.set({ "n", "x" }, "<C-j>", [[/^#\+ .*<CR>]], { desc = "Next Heading", buffer = true })
vim.keymap.set({ "n", "x" }, "<C-k>", [[?^#\+ .*<CR>]], { desc = "Prev Heading", buffer = true })
