return {
    {
        "bennypowers/nvim-regexplainer",
        config = function()
            require("regexplainer").setup()
        end,
        event = "BufReadPost",
        requires = {
            "nvim-treesitter/nvim-treesitter",
            "MunifTanjim/nui.nvim",
        },
    },
}
