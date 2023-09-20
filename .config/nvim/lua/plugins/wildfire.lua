return {
    {
        "sustech-data/wildfire.nvim",
        event = "BufRead",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("wildfire").setup()
        end,
    },
}
