return {
    {
        "nacro90/numb.nvim",
        event = "BufRead",
        config = function()
            require("numb").setup({})
        end,
    },
}
