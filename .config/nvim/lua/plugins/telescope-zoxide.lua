return {
    {
        "jvgrootveld/telescope-zoxide",
        event = "VeryLazy",
        config = function()
            require("telescope").load_extension("zoxide")
        end,
    },
}
