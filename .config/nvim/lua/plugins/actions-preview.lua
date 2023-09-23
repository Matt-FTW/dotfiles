return {
    {
        "aznhe21/actions-preview.nvim",
        event = "BufRead",
        config = function()
            vim.keymap.set(
                { "v", "n" },
                "ga",
                require("actions-preview").code_actions,
                { noremap = true, silent = true, desc = "Code Actions" }
            )
            require("actions-preview").setup({
                telescope = {
                    sorting_strategy = "ascending",
                    layout_strategy = "vertical",
                    layout_config = {
                        width = 0.8,
                        height = 0.9,
                        prompt_position = "top",
                        preview_cutoff = 20,
                        preview_height = function(_, _, max_lines)
                            return max_lines - 15
                        end,
                    },
                },
            })
        end,
    },
}
