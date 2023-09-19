return {
    {
        "kosayoda/nvim-lightbulb",
        config = function()
            require("nvim-lightbulb").setup({
                sign = {
                    enabled = false,
                    priority = 10,
                },
                float = {
                    enabled = true,
                    text = "💡",
                    win_opts = {},
                },
                virtual_text = {
                    enabled = false,
                    text = "💡",
                },
            })
        end,
    },
}
