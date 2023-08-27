return {
    {
        "prochri/telescope-all-recent.nvim",
        event = "VeryLazy",
        config = function()
            require("telescope-all-recent").setup({
                pickers = {
                    ["workspaces.nvim#workspaces"] = {
                        disable = false,
                        sorting = "frecency",
                    },
                },
            })
        end,
    },
}
