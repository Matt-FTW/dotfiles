return {
  {
    "sindrets/diffview.nvim",
    keys = {
      { "<leader>gd", "<cmd>DiffviewFileHistory<CR>", desc = "Diff File History" },
    },
    opts = {},
  },
  {
    "akinsho/git-conflict.nvim",
    opts = {
      default_mappings = false,
    },
    keys = {
      { "<leader>gct", "<cmd>GitConflictChooseTheirs<cr>", desc = "Choose Their Changes" },
      { "<leader>gco", "<cmd>GitConflictChooseOurs<cr>", desc = "Choose Our Changes" },
      { "<leader>gcb", "<cmd>GitConflictChooseBoth<cr>", desc = "Choose Both changes" },
      { "<leader>gcl", "<cmd>GitConflictListQf<cr>", desc = "Git Conflict Quicklist" },
      { "[g", "<cmd>GitConflictPrevConflict<cr>", desc = "Prev Git Conflict" },
      { "]g", "<cmd>GitConflictPrevConflict<cr>", desc = "Next Git Conflict" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>gc"] = { name = "+conflicts" },
      },
    },
  },
}
