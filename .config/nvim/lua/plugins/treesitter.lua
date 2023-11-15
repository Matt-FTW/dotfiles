return {
  {
    "nvim-treesitter/nvim-treesitter",
    ---@type TSConfig
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      endwise = { enable = true },
      ensure_installed = {
        "http",
        "ini",
      },
    },
  },
  {
    "RRethy/nvim-treesitter-endwise",
    event = "BufRead",
  },
  {
    "chrisgrieser/nvim-puppeteer",
    dependencies = "nvim-treesitter/nvim-treesitter",
    lazy = false,
  },
}
