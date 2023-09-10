return {
    {
        "piersolenski/telescope-import.nvim",
        requires = "nvim-telescope/telescope.nvim",
        event = "VeryLazy",
        config = function(_, opts)
            require("telescope").load_extension("import")
        end,
    },
}
