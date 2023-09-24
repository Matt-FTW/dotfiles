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
                    ["project.nvim#projects"] = {
                        disable = false,
                        sorting = "frecency",
                    },
                    ["yanky.nvim#yank_history"] = {
                        disable = true,
                    },
                },
            })
        end,
    },
}
