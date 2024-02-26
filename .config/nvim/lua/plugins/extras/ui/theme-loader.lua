return {
  {
    "rafi/theme-loader.nvim",
    lazy = false,
    priority = 999,
    opts = {},
  },
  {
    "LazyVim/LazyVim",
    config = function(_, opts)
      opts = opts or {}
      -- disable the colorscheme
      opts.colorscheme = function() end
      require("lazyvim").setup(opts)
    end,
  },
}
