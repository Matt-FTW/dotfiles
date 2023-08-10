return {
    {
        "voldikss/vim-floaterm",
        "dawsers/telescope-floaterm.nvim",
        config = function(_, opts)
            require("telescope").load_extension("floaterm")
        end,
    },
}
