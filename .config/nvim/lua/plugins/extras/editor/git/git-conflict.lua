return {
  {
    "akinsho/git-conflict.nvim",
    opts = {
      default_mappings = false,
    },
    version = "v1.0.0",
    cmd = { "GitConflictChooseTheirs", "GitConflictChooseOurs", "GitConflictChooseBoth", "GitConflictListQf" },
    keys = {
      { "<leader>gCt", "<cmd>GitConflictChooseTheirs<cr>", desc = "Choose Their Changes" },
      { "<leader>gCo", "<cmd>GitConflictChooseOurs<cr>", desc = "Choose Our Changes" },
      { "<leader>gCb", "<cmd>GitConflictChooseBoth<cr>", desc = "Choose Both changes" },
      { "<leader>gCl", "<cmd>GitConflictListQf<cr>", desc = "Git Conflict Quicklist" },
      { "[g", "<cmd>GitConflictPrevConflict<cr>", desc = "Prev Git Conflict" },
      { "]g", "<cmd>GitConflictPrevConflict<cr>", desc = "Next Git Conflict" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>gC"] = { name = "conflicts" },
      },
    },
  },
}
