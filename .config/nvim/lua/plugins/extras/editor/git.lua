local Util = require("lazyvim.util")

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
    "ThePrimeagen/git-worktree.nvim",
    opts = {},
    config = function(_, opts)
      Util.on_load("telescope.nvim", function()
        require("telescope").load_extension("git_worktree")
      end)
    end,
    keys = {
      {
        "<leader>gwm",
        function()
          require("telescope").extensions.git_worktree.git_worktrees()
        end,
        desc = "Manage Worktrees",
      },
      {
        "<leader>gwc",
        function()
          require("telescope").extensions.git_worktree.create_git_worktree()
        end,
        desc = "Create Worktree",
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>gc"] = { name = "+conflicts" },
        ["<leader>gw"] = { name = "+worktrees" },
      },
    },
  },
}
