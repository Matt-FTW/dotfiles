return {
    {
        "neovim/nvim-lspconfig",
        init = function()
            local keys = require("lazyvim.plugins.lsp.keymaps").get()
            keys[#keys + 1] = { "gd", "<CMD>Definitions<CR>" }
            keys[#keys + 1] = { "gr", "<CMD>References<CR>" }
            keys[#keys + 1] = { "gy", "<CMD>T[y]pe_definitions<CR>" }
            keys[#keys + 1] = { "gI", "<CMD>Implementations<CR>" }
        end,
    },
}
