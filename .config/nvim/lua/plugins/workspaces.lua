return {
    {
        "natecraddock/workspaces.nvim",
        opts = {},
        event = "VeryLazy",
        config = function(_, opts)
            require("workspaces").setup({
                hooks = {
                    open = { "Telescope find_files" },
                }
            })
            require("telescope").load_extension("workspaces")
        end,
        keys = {
            { "<leader>fw", "<Cmd>Telescope workspaces<CR>", desc = "Workspaces" },
        },
    }
}
