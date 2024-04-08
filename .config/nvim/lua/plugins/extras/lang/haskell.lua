return {
  { import = "lazyvim.plugins.extras.lang.haskell" },
  {
    "luckasRanarison/nvim-devdocs",
    optional = true,
    opts = {
      ensure_installed = {
        "haskell-9",
      },
    },
  },
}
