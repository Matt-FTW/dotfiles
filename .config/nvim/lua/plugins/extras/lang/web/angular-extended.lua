return {
  { import = "plugins.extras.lang.web.typescript-extended" },
  { import = "plugins.extras.lang.web.html-css" },
  { import = "lazyvim.plugins.extras.lang.angular" },
  {
    "luckasRanarison/nvim-devdocs",
    optional = true,
    opts = {
      ensure_installed = {
        "angular",
      },
    },
  },
}
