return {
    {
        "anuvyklack/windows.nvim",
        event = "WinNew",
        dependencies = {
            { "anuvyklack/middleclass" },
            { "anuvyklack/animation.nvim", enabled = false },
        },
        keys = {
            { "<leader>wv", "<cmd>WindowsMaximizeVertically<cr>", desc = "Vertical Zoom" },
            { "<leader>wh", "<cmd>WindowsMaximizeHorizontally<cr>", desc = "Horizontal Zoom" },
            { "<leader>we", "<cmd>WindowsEqualize<cr>", desc = "Equalize Zoom" },
        },
        config = function()
            vim.o.winwidth = 10
            vim.o.winminwidth = 10
            vim.o.equalalways = false
            require("windows").setup({
                animation = { enable = false, duration = 150 },
            })
        end,
    },
}
