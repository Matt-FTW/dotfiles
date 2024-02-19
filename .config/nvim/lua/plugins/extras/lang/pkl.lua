return {
  "apple/pkl-neovim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  build = function()
    vim.cmd("TSInstall! pkl")
  end,
  event = "BufRead *.pkl",
}
