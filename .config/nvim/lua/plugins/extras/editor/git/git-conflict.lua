local prefix = "<leader>gC"

return {
  {
    "akinsho/git-conflict.nvim",
    opts = {
      default_mappings = false,
    },
    version = "v1.0.0",
    cmd = { "GitConflictChooseTheirs", "GitConflictChooseOurs", "GitConflictChooseBoth", "GitConflictListQf" },
    keys = {
      { prefix .. "t", "<cmd>GitConflictChooseTheirs<cr>", desc = "Choose Their Changes" },
      { prefix .. "o", "<cmd>GitConflictChooseOurs<cr>", desc = "Choose Our Changes" },
      { prefix .. "b", "<cmd>GitConflictChooseBoth<cr>", desc = "Choose Both changes" },
      { prefix .. "l", "<cmd>GitConflictListQf<cr>", desc = "Git Conflict Quicklist" },
      { "[g", "<cmd>GitConflictPrevConflict<cr>", desc = "Prev Git Conflict" },
      { "]g", "<cmd>GitConflictPrevConflict<cr>", desc = "Next Git Conflict" },
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
