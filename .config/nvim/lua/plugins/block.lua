return {
    {
        "HampusHauffman/block.nvim",
        keys = { { "<leader>ub", ":Block<CR>", desc = "Toggle Block" } },
        config = function()
            require("block").setup({
                percent = 0.9,
                depth = 4,
                colors = nil,
                automatic = false,
            })
        end,
    },
}
