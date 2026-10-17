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
    "OXY2DEV/markview.nvim",
    enabled = false,
    lazy = false,
    ft = { "markdown", "norg", "rmd", "org", "codecompanion", "latex", "typst" },
    opts = {
      preview = {
        icon_provider = "mini",
      },
      code_blocks = {
        sign = false,
      },
    },
    keys = {
      { "<leader>um", "<cmd>Markview Toggle<cr>", desc = "Toggle Render" },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = true,
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
