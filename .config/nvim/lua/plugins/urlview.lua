return {
    {
        "axieax/urlview.nvim",
        cmd = { "UrlView" },
        keys = { { "<leader>su", "<cmd>UrlView<cr>", desc = "Search Urls" } },
        config = function()
            require("urlview").setup({
                default_picker = "telescope",
            })
        end,
    },
}
