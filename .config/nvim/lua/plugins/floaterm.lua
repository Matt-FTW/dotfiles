return {
    {
        "voldikss/vim-floaterm",
        "dawsers/telescope-floaterm.nvim",
        cmd = { "FloatermNew", "FloatermToggle", "FloatermNext", "FloatermPrev" },
        config = function(_, opts)
            require("telescope").load_extension("floaterm")
        end,
    },
}
