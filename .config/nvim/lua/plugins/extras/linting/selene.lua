return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "selene",
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft.lua = opts.linters_by_ft.lua or {}
      table.insert(opts.linters_by_ft.lua, "selene")

      opts.linters = {
        selene = {
          condition = function(ctx)
            return vim.fs.find({ "selene.toml" }, { path = ctx.filename, upward = true })[1]
          end,
        },
      }

      return opts
    end,
  },
}
