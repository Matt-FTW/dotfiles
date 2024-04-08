return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "vue" })
      end
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        volar = {
          handlers = {
            ["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
              require("ts-error-translator").translate_diagnostics(err, result, ctx, config)
              vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)
            end,
          },
        },
        tsserver = {},
      },
      setup = {
        tsserver = function(_, opts)
          local mason_registry = require("mason-registry")
          local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
            .. "/node_modules/@vue/language-server"

          opts.init_options = {
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = vue_language_server_path,
                languages = { "vue" },
              },
            },
          }
          opts.filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
        end,
      },
    },
  },
  {
    "dmmulroy/ts-error-translator.nvim",
    opts = {},
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "vue-language-server" })
    end,
  },
  {
    "luckasRanarison/nvim-devdocs",
    optional = true,
    opts = {
      ensure_installed = {
        "vue-3",
      },
    },
  },
}
