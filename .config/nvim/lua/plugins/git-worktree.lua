return {
    {
        "ThePrimeagen/git-worktree.nvim",
        opts = {},
        config = function()
            require("telescope").load_extension("git_worktree")
        end,
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
    --stylua: ignore
    keys = {
      {"<leader>gwm", function() require("telescope").extensions.git_worktree.git_worktrees() end, desc = "Manage Worktrees"},
      {"<leader>gwc", function() require("telescope").extensions.git_worktree.create_git_worktree() end, desc = "Create Worktree"},
    },
    },
}
