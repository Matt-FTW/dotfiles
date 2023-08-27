return {
    {
        "tzachar/highlight-undo.nvim",
        event = "BufReadPost",
        config = function()
            require("highlight-undo").setup({
                duration = 700,
            })
        end,
    },
}
