return {
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        keys = { { "<leader>uz", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
        opts = {
            plugins = {
                scrollview = { enabled = false },
            },
        },
    },
}
