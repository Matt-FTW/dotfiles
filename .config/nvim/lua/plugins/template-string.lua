return {
    {
        "axelvc/template-string.nvim",
        event = "BufRead",
        config = function()
            require("template-string").setup()
        end,
    },
}
