return {
  { import = "lazyvim.plugins.extras.lang.docker" },
  {
    "luckasRanarison/nvim-devdocs",
    optional = true,
    opts = {
      ensure_installed = {
        "docker",
      },
    },
  },
}
