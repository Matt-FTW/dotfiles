local filetype = { "markdown", "text", "tex", "plaintex", "norg" }

return {
  { import = "lazyvim.plugins.extras.lang.markdown" },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          prepend_args = { "--config", os.getenv("HOME") .. "/.config/nvim/rules/.markdownlint-cli2.yaml", "--" },
        },
      },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      render_modes = { "n", "c", "t" },
      checkbox = {
        enabled = true,
      },
      heading = {
        atx = false,
      },
      preset = "obsidian",
    },
  },
  {
    "luckasRanarison/nvim-devdocs",
    optional = true,
    opts = {
      ensure_installed = {
        "markdown",
      },
    },
  },
}
