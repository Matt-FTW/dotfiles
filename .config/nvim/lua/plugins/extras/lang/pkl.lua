return {
  "apple/pkl-neovim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "pkl" })
    end,
  },
  event = "BufRead *.pkl",
}
