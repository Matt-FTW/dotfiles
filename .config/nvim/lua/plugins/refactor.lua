return {
    {
        "ThePrimeagen/refactoring.nvim",
        event = "BufRead",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-treesitter/nvim-treesitter" },
        },
        config = function()
            require("refactoring").setup()
        end,
    },
}
