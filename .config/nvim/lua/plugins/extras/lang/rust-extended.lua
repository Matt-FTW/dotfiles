return {
  { import = "lazyvim.plugins.extras.lang.rust" },
  {
    "simrat39/rust-tools.nvim",
    enabled = false,
  },
  -- TODO: Look at crates lsp
  -- {
  --   "Saecki/crates.nvim",
  --   opts = {
  --     lsp = {
  --       enabled = true,
  --       on_attach = function(client, bufnr) end,
  --       actions = true,
  --       completion = true,
  --     },
  --   },
  -- },
  {
    "mrcjkb/rustaceanvim",
    version = "^3", -- Recommended
    ft = { "rust" },
    opts = {
      server = {
        on_attach = function(client, bufnr)
          -- register which-key mappings
          local wk = require("which-key")
          -- stylua: ignore
          wk.register({
            ["<leader>cR"] = { function() vim.cmd.RustLsp("codeAction") end, "Code Action" },
            ["<leader>dr"] = { function() vim.cmd.RustLsp("debuggables") end, "Rust debuggables" },
          }, { mode = "n", buffer = bufnr })
        end,
        settings = {
          -- rust-analyzer language server configuration
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              runBuildScripts = true,
            },
            -- Add clippy lints for Rust.
            checkOnSave = {
              allFeatures = true,
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
            procMacro = {
              enable = true,
              ignored = {
                ["async-trait"] = { "async_trait" },
                ["napi-derive"] = { "napi" },
                ["async-recursion"] = { "async_recursion" },
              },
            },
          },
        },
      },
    },
    config = function(_, opts)
      vim.g.rustaceanvim = vim.tbl_deep_extend("force", {}, opts or {})
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = {},
      },
      setup = {
        rust_analyzer = function()
          return true
        end,
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft.toml = opts.formatters_by_ft.toml or {}
      table.insert(opts.formatters_by_ft.toml, "taplo")

      opts.formatters_by_ft.rust = opts.formatters_by_ft.rust or {}
      table.insert(opts.formatters_by_ft.rust, "rustfmt")
      return opts
    end,
  },
  {
    "luckasRanarison/nvim-devdocs",
    optional = true,
    ensure_installed = {
      "rust",
    },
  },
}
