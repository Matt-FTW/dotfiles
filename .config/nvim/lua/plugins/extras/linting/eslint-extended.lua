return {
  { import = "lazyvim.plugins.extras.linting.eslint" },
  {
    "luckasRanarison/nvim-devdocs",
    optional = true,
    ensure_installed = {
      "eslint",
    },
  },
}
