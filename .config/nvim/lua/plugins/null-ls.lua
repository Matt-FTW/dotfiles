return {
    {
        "jose-elias-alvarez/null-ls.nvim",
        opts = function(_, opts)
            local nls = require("null-ls")

            opts.sources = opts.sources or {}
            vim.list_extend(opts.sources, {
                nls.builtins.formatting.beautysh,
                nls.builtins.formatting.black,
                nls.builtins.formatting.codespell,
                nls.builtins.formatting.csharpier,
                nls.builtins.formatting.ktlint,
                nls.builtins.formatting.rustywind,
                nls.builtins.formatting.sqlfmt,
                nls.builtins.formatting.rustfmt
            })
        end,
    },
}
