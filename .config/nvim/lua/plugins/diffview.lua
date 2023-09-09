return {
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffviewFileHistory" },
        keys = {
            { "<Leader>gdd", "<cmd>DiffviewFileHistory<CR>", desc = "Diff File History" },
            { "<Leader>gdo", "<cmd>DiffviewOpen<CR>", desc = "Open Diff View" },
            { "<Leader>gdc", "<cmd>DiffviewClose<CR>", desc = "Close Diff View" },
        },
        event = "BufRead",
        config = function()
            require("diffview").setup()
        end,
    },
}
