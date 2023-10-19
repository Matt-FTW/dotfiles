-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Disable diagnostics in a .env file
vim.api.nvim_create_autocmd("BufRead", {
  pattern = ".env",
  callback = function()
    vim.diagnostic.disable(0)
  end,
})

-- start git messages in insert mode
vim.api.nvim_create_autocmd("BufRead", {
  pattern = { "gitcommit", "gitrebase" },
  callback = function()
    vim.cmd("startinsert")
  end,
})
