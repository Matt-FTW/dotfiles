return {
  { import = "lazyvim.plugins.extras.lang.nix" },
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft.nix = opts.linters_by_ft.nix or {}
      table.insert(opts.linters_by_ft.nix, "statix")
      return opts
    end,
  },
  {
    "luckasRanarison/nvim-devdocs",
    optional = true,
    opts = {
      ensure_installed = {
        "nix",
      },
    },
  },
}
