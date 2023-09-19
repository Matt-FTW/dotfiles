return {
    {
        "neovim/nvim-lspconfig",
        init = function()
            local keys = require("lazyvim.plugins.lsp.keymaps").get()
            keys[#keys + 1] = { "gd", "<CMD>Glance definitions<CR>", desc = "Goto definition" }
            keys[#keys + 1] = { "gr", "<CMD>Glance references<CR>", desc = "References" }
            keys[#keys + 1] = { "gy", "<CMD>Glance type_definitions<CR>", desc = "Goto t[y]pe definitions" }
            keys[#keys + 1] = { "gI", "<CMD>Glance implementations<CR>", desc = "Goto implementations" }
        end,
    },
}
