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
      opts.linters_by_ft.html = opts.linters_by_ft.html or {}
      table.insert(opts.linters_by_ft.html, stylelint)

      opts.linters_by_ft.css = opts.linters_by_ft.css or {}
      table.insert(opts.linters_by_ft.css, stylelint)

      opts.linters_by_ft.scss = opts.linters_by_ft.scss or {}
      table.insert(opts.linters_by_ft.scss, stylelint)

      opts.linters_by_ft.sass = opts.linters_by_ft.sass or {}
      table.insert(opts.linters_by_ft.sass, stylelint)

      opts.linters_by_ft.less = opts.linters_by_ft.less or {}
      table.insert(opts.linters_by_ft.less, stylelint)
      return opts
    end,
  },
}
