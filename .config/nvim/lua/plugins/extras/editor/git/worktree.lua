return {
  {
    "ThePrimeagen/git-worktree.nvim",
    opts = {},
    config = function()
      require("lazyvim.util").on_load("telescope.nvim", function()
        require("telescope").load_extension("git_worktree")
      end)
    end,
    -- stylua: ignore
    keys = {
      { "<leader>gwm", function() require("telescope").extensions.git_worktree.git_worktrees() end, desc = "Manage Worktrees" },
      { "<leader>gwc", function() require("telescope").extensions.git_worktree.create_git_worktree() end, desc = "Create Worktree" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>gw"] = { name = "worktrees" },
      },
    },
  },
}
