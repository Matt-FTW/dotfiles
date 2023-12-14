-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Disable diagnostics in a .env file
vim.api.nvim_create_autocmd("BufRead", {
  pattern = ".env",
  callback = function()
    vim.diagnostic.disable(0)
  end,
})

-- Fix telescope entering on insert mode
vim.api.nvim_create_autocmd("WinLeave", {
  callback = function()
    if vim.bo.ft == "TelescopePrompt" and vim.fn.mode() == "i" then
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "i", false)
    end
  end,
})

local auto_close_filetype = {
  "lazy",
  "mason",
  "lspinfo",
  "toggleterm",
  "null-ls-info",
  "TelescopePrompt",
  "notify",
}

-- Auto close window when leaving
vim.api.nvim_create_autocmd("BufLeave", {
  group = augroup("auto_close_win"),
  callback = function(event)
    local ft = vim.api.nvim_buf_get_option(event.buf, "filetype")

    if vim.fn.index(auto_close_filetype, ft) ~= -1 then
      local winids = vim.fn.win_findbuf(event.buf)
      for _, win in pairs(winids) do
        vim.api.nvim_win_close(win, true)
      end
    end
  end,
})

-- Disable leader and localleader for some filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("unbind_leader_key"),
  pattern = {
    "lazy",
    "mason",
    "lspinfo",
    "toggleterm",
    "null-ls-info",
    "neo-tree-popup",
    "TelescopePrompt",
    "notify",
    "floaterm",
  },
  callback = function(event)
    vim.keymap.set("n", "<leader>", "<nop>", { buffer = event.buf, desc = "" })
    vim.keymap.set("n", "<localleader>", "<nop>", { buffer = event.buf, desc = "" })
  end,
})

-- Delete number column on terminals
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.cmd("setlocal listchars= nonumber norelativenumber")
  end,
})
