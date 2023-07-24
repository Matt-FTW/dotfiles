return {
    {
        "folke/which-key.nvim",
        optional = true,
        opts = {
            defaults = {
                ["<leader>d"] = { name = "+debug" },
                ["<leader>da"] = { name = "+adapters" },
            },
        },
    }
}
