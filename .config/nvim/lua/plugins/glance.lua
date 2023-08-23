return {
    {
        "dnlhc/glance.nvim",
        cmd = { "Glance" },
        config = function()
            require("glance").setup({
                border = {
                    enable = true,
                },
            })
        end,
    },
}
