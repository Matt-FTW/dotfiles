return {
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        keys = { { "<leader>uz", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" } },
        opts = {
            plugins = {
                scrollview = { enabled = false },
                gitsigns = { enabled = false },
                barbacue = { enabled = false },
            },
        },
    },
}
