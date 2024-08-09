local prefix = "<leader>gw"

return {
  {
    "ThePrimeagen/git-worktree.nvim",
    opts = {},
    config = function()
      LazyVim.on_load("telescope.nvim", function()
        require("telescope").load_extension("git_worktree")
      end)
    end,
    -- stylua: ignore
    keys = {
      { prefix .. "m", function() require("telescope").extensions.git_worktree.git_worktrees() end, desc = "Manage Worktrees" },
      { prefix .. "c", function() require("telescope").extensions.git_worktree.create_git_worktree() end, desc = "Create Worktree" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { prefix, group = "worktrees", icon = " " },
      },
    },
  },
}
