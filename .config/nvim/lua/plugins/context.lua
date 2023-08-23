return {
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "BufReadPost",
        config = function()
            require("treesitter-context").setup()
        end,
    },
}
