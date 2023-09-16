return {
    {
        "benfowler/telescope-luasnip.nvim",
        event = "VeryLazy",
        config = function()
            require("telescope").load_extension("luasnip")
        end,
    },
}
