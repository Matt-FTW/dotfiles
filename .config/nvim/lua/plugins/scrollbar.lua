return {
    {
        "dstein64/nvim-scrollview",
        config = function()
            require("scrollview").setup({
                excluded_filetypes = { "neo-tree", "neotree" },
                signs_column = 0,
                winblend = 25,
                diagnostics_error_symbol = "",
                diagnostics_warn_symbol = "",
                diagnostics_info_symbol = "",
                diagnostics_hint_symbol = "",
            })
        end,
    },
}
