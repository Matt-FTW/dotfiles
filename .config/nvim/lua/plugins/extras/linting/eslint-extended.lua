return {
  { import = "lazyvim.plugins.extras.linting.eslint" },
  {
    "luckasRanarison/nvim-devdocs",
    optional = true,
    opts = {
      ensure_installed = {
        "eslint",
      },
    },
  },
}
