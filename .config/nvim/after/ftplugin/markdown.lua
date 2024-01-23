vim.keymap.set({ "n", "x" }, "]#", [[/^#\+ .*<CR>]], { desc = "Next Heading", buffer = true })
vim.keymap.set({ "n", "x" }, "[#", [[?^#\+ .*<CR>]], { desc = "Prev Heading", buffer = true })
