local prefix = "<leader>gC"

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
      default_mappings = {
        ours = prefix .. "o",
        theirs = prefix .. "t",
        none = prefix .. "n",
        both = prefix .. "b",
      },
    },
    cmd = {
      "GitConflictChooseTheirs",
      "GitConflictChooseOurs",
      "GitConflictChooseBoth",
      "GitConflictListQf",
      "GitConflictRefresh",
      "GitConflictNextConflict",
      "GitConflictPrevConflict",
    },
    keys = {
      { "]g", "<cmd>GitConflictNextConflict<cr>", desc = "Next Conflict" },
      { "[g", "<cmd>GitConflictPrevConflict<cr>", desc = "Previous Conflict" },
      { prefix .. "l", "<cmd>GitConflictListQf<cr>", desc = "List Conflicts" },
      { prefix .. "r", "<cmd>GitConflictRefresh<cr>", desc = "Refresh Conflicts" },
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
