return {
  { import = "lazyvim.plugins.extras.lang.rust" },
  {
    "luckasRanarison/nvim-devdocs",
    optional = true,
    ensure_installed = {
      "rust",
    },
  },
}
