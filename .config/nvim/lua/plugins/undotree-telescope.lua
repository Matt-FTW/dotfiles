return {
    {
        "debugloop/telescope-undo.nvim",
        opts = {},
        event = "VeryLazy",
        config = function(_, opts)
            require("telescope").load_extension("undo")
        end,
    }
}
