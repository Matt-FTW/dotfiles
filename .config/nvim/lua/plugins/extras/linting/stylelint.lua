local stylelint = "stylelint"

return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { stylelint })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      local function add_linters(tbl)
        for ft, linters in pairs(tbl) do
          if opts.linters_by_ft[ft] == nil then
            opts.linters_by_ft[ft] = linters
          else
            vim.list_extend(opts.linters_by_ft[ft], linters)
          end
        end
      end

      add_linters({
        ["html"] = { "stylelint" },
        ["css"] = { "stylelint" },
        ["scss"] = { "stylelint" },
        ["sass"] = { "stylelint" },
        ["less"] = { "stylelint" },
      })

      return opts
    end,
  },
}
