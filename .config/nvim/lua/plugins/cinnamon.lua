return {
    {
        "declancm/cinnamon.nvim",
        event = "VeryLazy",
        config = function()
            require("cinnamon").setup({
                default_keymaps = true,
                extra_keymaps = true,
                extended_keymaps = true,
                override_keymaps = true,
            })
        end,
    },
}
