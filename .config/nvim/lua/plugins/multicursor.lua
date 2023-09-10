return {
    {
        "smoka7/multicursors.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "smoka7/hydra.nvim",
        },
        cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
        keys = {
            {
                mode = { "v", "n" },
                "<Leader>m",
                "<cmd>MCstart<cr>",
                desc = "Create a selection for selected text or word under the cursor",
            },
        },
    },
}
