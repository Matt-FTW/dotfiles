return {
    {
        "jose-elias-alvarez/null-ls.nvim",
        opts = function(_, opts)
            if type(opts.sources) == "table" then
                local nls = require("null-ls")
                vim.list_extend(opts.sources, {
                    nls.builtins.code_actions.gomodifytags,
                    nls.builtins.code_actions.impl,
                    nls.builtins.formatting.gofumpt,
                    nls.builtins.formatting.goimports_reviser,
                })
            end

            local nls = require("null-ls")
            opts.sources = opts.sources or {}
            vim.list_extend(opts.sources, {
                nls.builtins.diagnostics.hadolint,
            })

            local nls = require("null-ls")
            opts.sources = opts.sources or {}
            vim.list_extend(opts.sources, {
                nls.builtins.diagnostics.cmake_lint,
            })

            table.insert(opts.sources, require("typescript.extensions.null-ls.code-actions"))

            local nls = require("null-ls")
            table.insert(opts.sources, nls.builtins.formatting.prettierd)
        end,
    }
}
