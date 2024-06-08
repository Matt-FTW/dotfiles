return {
  { import = "lazyvim.plugins.extras.lang.git" },
  {
    "luckasRanarison/nvim-devdocs",
    optional = true,
    opts = {
      ensure_installed = {
        "git",
      },
    },
  },
}
