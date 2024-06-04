local inlay_hints_settings = {
  parameterNames = { enabled = "all" },
  parameterTypes = { enabled = true },
  variableTypes = { enabled = true },
  propertyDeclarationTypes = { enabled = true },
  functionLikeReturnTypes = { enabled = true },
  enumMemberValues = { enabled = true },
}

return {
  { import = "lazyvim.plugins.extras.lang.svelte" },
  { import = "plugins.extras.lang.web.typescript-extended" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        svelte = {
          settings = {
            typescript = {
              updateImportsOnFileMove = { enabled = "always" },
              inlayHints = inlay_hints_settings,
            },
            javascript = {
              updateImportsOnFileMove = { enabled = "always" },
              inlayHints = inlay_hints_settings,
            },
          },
          handlers = {
            ["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
              require("ts-error-translator").translate_diagnostics(err, result, ctx, config)
              vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)
            end,
          },
        },
      },
    },
  },
  {
    "dmmulroy/ts-error-translator.nvim",
    opts = {},
  },
  {
    "luckasRanarison/nvim-devdocs",
    optional = true,
    opts = {
      ensure_installed = {
        "svelte",
      },
    },
  },
}
