return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "biome" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        biome = {
          root_dir = require("lspconfig").util.root_pattern("biome.json"),
          single_file_support = false,
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      local function add_formatters(tbl)
        for ft, formatters in pairs(tbl) do
          if opts.formatters_by_ft[ft] == nil then
            opts.formatters_by_ft[ft] = formatters
          else
            vim.list_extend(opts.formatters_by_ft[ft], formatters)
          end
        end
      end

      add_formatters({
        ["jsonc"] = { "biome" },
        ["json"] = { "biome" },
        ["javascript"] = { "biome" },
        ["typescript"] = { "biome" },
        ["typescriptreact"] = { "biome" },
        ["javascriptreact"] = { "biome" },
      })

      opts.formatters = {
        cwd = require("conform.util").root_file({ "biome.json" }),
        biome = {
          condition = function(self, ctx)
            return vim.fs.find({ "biome.json" }, { path = ctx.filename, upward = true })[1]
          end,
        },
        prettier = {
          condition = function(self, ctx)
            return not vim.fs.find({ "biome.json" }, { path = ctx.filename, upward = true })[1]
          end,
        },
      }

      return opts
    end,
  },
}
