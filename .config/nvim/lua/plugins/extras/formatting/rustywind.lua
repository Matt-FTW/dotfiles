return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "rustywind" })
    end,
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
        ["javascript"] = { "rustywind" },
        ["javascriptreact"] = { "rustywind" },
        ["typescript"] = { "rustywind" },
        ["typescriptreact"] = { "rustywind" },
        ["vue"] = { "rustywind" },
        ["html"] = { "rustywind" },
      })
    end,
  },
}
