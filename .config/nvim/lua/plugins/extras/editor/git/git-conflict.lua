local prefix = "<leader>gc"

vim.api.nvim_create_autocmd("User", {
  pattern = "GitConflictDetected",
  callback = function()
    vim.notify("Conflict detected in " .. vim.fn.expand("<afile>"))
  end,
})

return {
  {
    "akinsho/git-conflict.nvim",
    opts = {
      default_mappings = false,
      disable_diagnostics = true,
    },
    event = "VeryLazy",
    keys = {
      { "]g", "<cmd>GitConflictNextConflict<cr>", desc = "Next Conflict" },
      { "[g", "<cmd>GitConflictPrevConflict<cr>", desc = "Previous Conflict" },
      { prefix .. "l", "<cmd>GitConflictListQf<cr>", desc = "List Conflicts" },
      { prefix .. "r", "<cmd>GitConflictRefresh<cr>", desc = "Refresh Conflicts" },
      { prefix .. "b", mode = { "n", "v" }, "<cmd>GitConflictChooseBoth<cr>", desc = "Both" },
      { prefix .. "o", mode = { "n", "v" }, "<cmd>GitConflictChooseOurs<cr>", desc = "Ours" },
      { prefix .. "t", mode = { "n", "v" }, "<cmd>GitConflictChooseTheirs<cr>", desc = "Theirs" },
      { prefix .. "n", mode = { "n", "v" }, "<cmd>GitConflictChooseNone<cr>", desc = "None" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { prefix, group = "conflicts", icon = " " },
      },
    },
  },
}
