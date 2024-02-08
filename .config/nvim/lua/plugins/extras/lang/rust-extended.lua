return {
  { import = "lazyvim.plugins.extras.lang.rust" },
  {
    "simrat39/rust-tools.nvim",
    enabled = false,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^4", -- Recommended
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
        default_settings = {
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
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "rouge8/neotest-rust",
      enabled = false,
    },
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      vim.list_extend(opts.adapters, {
        require("rustaceanvim.neotest"),
      })
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
    "Saecki/crates.nvim",
    -- stylua: ignore
    keys = {
       { "<leader>prR", function() require("crates").reload() end, desc = "Reload" },

       { "<leader>pru", function() require("crates").update_crate() end, desc = "Update Crate" },
       { "<leader>pru", mode = "v", function() require("crates").update_crates() end, desc = "Update Crates" },
       { "<leader>pra", function() require("crates").update_all_crates() end, desc = "Update All Crates" },

       { "<leader>prU", function() require("crates").upgrade_crate() end, desc = "Upgrade Crate" },
       { "<leader>prU", mode = "v", function() require("crates").upgrade_crates() end, desc = "Upgrade Crates" },
       { "<leader>prA", function() require("crates").upgrade_all_crates() end, desc = "Upgrade All Crates" },

       { "<leader>prt", function() require("crates").expand_plain_crate_to_inline_table() end, desc = "Extract into Inline Table" },
       { "<leader>prT", function() require("crates").extract_crate_into_table() end, desc = "Extract into Table" },

       { "<leader>prh", function() require("crates").open_homepage() end, desc = "Homepage" },
       { "<leader>prr", function() require("crates").open_repository() end, desc = "Repo" },
       { "<leader>prd", function() require("crates").open_documentation() end, desc = "Documentation" },
       { "<leader>prc", function() require("crates").open_crates_io() end, desc = "Crates.io" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>p"] = { name = " packages/dependencies" },
        ["<leader>pr"] = { name = "rust" },
      },
    },
  },
  {
    "luckasRanarison/nvim-devdocs",
    optional = true,
    ensure_installed = {
      "rust",
    },
  },
}
