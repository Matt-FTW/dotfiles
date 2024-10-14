return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "biome",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        biome = {},
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
        ["astro"] = { "biome" },
        ["svelte"] = { "biome" },
        ["vue"] = { "biome" },
        ["graphql"] = { "biome" },
        ["css"] = { "biome" },
      })

      opts.formatters = {
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
        prettierd = {
          condition = function(self, ctx)
            return not vim.fs.find({ "biome.json" }, { path = ctx.filename, upward = true })[1]
          end,
        },
      }

      return opts
    end,
  },
}
