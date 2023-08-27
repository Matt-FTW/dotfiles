return {
    {
        "dawsers/telescope-floaterm.nvim",
        opts = {},
        event = "VeryLazy",
        config = function(_, opts)
            require("telescope").load_extension("floaterm")
        end,
    },
}
