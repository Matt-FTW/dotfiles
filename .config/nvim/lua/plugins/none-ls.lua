return {
  {
    "nvimtools/none-ls.nvim",
    enabled = false,
    opts = function(_, opts)
      local nls = require("null-ls")

      opts.sources = opts.sources or {}
      vim.list_extend(opts.sources, {
        nls.builtins.formatting.beautysh,
        nls.builtins.formatting.black,
        nls.builtins.formatting.csharpier,
        nls.builtins.formatting.rustywind,
        nls.builtins.formatting.sqlfmt,
        nls.builtins.formatting.rustfmt,
        nls.builtins.formatting.fish_indent,
        nls.builtins.formatting.taplo,
        nls.builtins.diagnostics.fish,
        --nls.builtins.diagnostics.cspell,
        --nls.builtins.code_actions.cspell,
        nls.builtins.hover.dictionary,
        nls.builtins.hover.printenv,
        --nls.builtins.diagnostics.markuplint,
        nls.builtins.diagnostics.markdownlint,
        --nls.builtins.diagnostics.codespell,
      })
    end,
  },
}
