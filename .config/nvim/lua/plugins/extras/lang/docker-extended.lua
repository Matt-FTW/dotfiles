return {
  { import = "lazyvim.plugins.extras.lang.docker" },
  {
    "luckasRanarison/nvim-devdocs",
    optional = true,
    ensure_installed = {
      "docker",
    },
  },
}
