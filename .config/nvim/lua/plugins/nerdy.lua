return {
    {
        "2kabhishek/nerdy.nvim",
        dependencies = {
            "stevearc/dressing.nvim",
            "nvim-telescope/telescope.nvim",
        },
        cmd = "Nerdy",
        keys = {
            { "<leader>sN", "<cmd>Nerdy<cr>", desc = "Nerd Fonts" },
        },
    },
}
