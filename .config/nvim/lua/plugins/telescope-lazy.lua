return {
    {
        "tsakirist/telescope-lazy.nvim",
        event = "VeryLazy",
        config = function()
            require("telescope").load_extension("lazy")
        end,
    },
}
