return {
    {
        "Bekaboo/dropbar.nvim",
        event = "BufRead",
        config = function()
            require("dropbar").setup()
        end,
    },
}
