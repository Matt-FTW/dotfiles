return {
    {
        "simrat39/symbols-outline.nvim",
        event = "BufReadPost",
        cmd = "SymbolsOutline",
        keys = { { "<leader>ul", "<cmd>SymbolsOutline<cr>", desc = "Lsp Symbols Outline" } },
        config = function()
            require("symbols-outline").setup()
        end,
    },
}
