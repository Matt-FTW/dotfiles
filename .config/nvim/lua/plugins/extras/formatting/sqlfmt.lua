return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "sqlfmt" })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      --- Extend the conform plugin config and add given formatters
      ---@param tbl table<string, conform.FormatterUnit[]> Table of filetype to formatters mappings
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
        ["sql"] = { "sqlfmt" },
        ["plsql"] = { "sqlfmt" },
        ["mysql"] = { "sqlfmt" },
      })
    end,
  },
}
