return {
  { import = "lazyvim.plugins.extras.lang.php" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "phpdoc",
      },
    },
  },
  {
    "luckasRanarison/nvim-devdocs",
    optional = true,
    opts = {
      ensure_installed = {
        "php",
      },
    },
  },
}
