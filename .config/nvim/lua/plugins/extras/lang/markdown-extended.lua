local filetype = { "markdown", "text", "tex", "plaintex", "norg" }

return {
  { import = "lazyvim.plugins.extras.lang.markdown" },
  {
    "gaoDean/autolist.nvim",
    enabled = false,
    ft = filetype,
    opts = {},
    keys = {
      { "<CR>", "<CR><cmd>AutolistNewBullet<cr>", mode = { "i" }, ft = filetype },
      { "o", "o<cmd>AutolistNewBullet<cr>", mode = { "n" }, ft = filetype },
      { "O", "O<cmd>AutolistNewBulletBefore<cr>", mode = { "n" }, ft = filetype },
      { "<CR>", "<cmd>AutolistToggleCheckbox<cr><CR>", mode = { "n" }, ft = filetype },
      { "<C-r>", "<cmd>AutolistRecalculate<cr>", mode = { "n" }, ft = filetype },

      { "].", "<cmd>AutolistCycleNext<cr>", mode = { "n" }, desc = "Next List Type", ft = filetype },
      { "[.", "<cmd>AutolistCyclePrev<cr>", mode = { "n" }, desc = "Prev List Type", ft = filetype },

      { ">>", ">><cmd>AutolistRecalculate<cr>", mode = { "n" }, ft = filetype },
      { "<<", "<<<cmd>AutolistRecalculate<cr>", mode = { "n" }, ft = filetype },
      { "dd", "dd<cmd>AutolistRecalculate<cr>", mode = { "n" }, ft = filetype },
      { "d", "d<cmd>AutolistRecalculate<cr>", mode = { "v" }, ft = filetype },
    },
  },
  {
    "antonk52/markdowny.nvim",
    enabled = false,
    ft = filetype,
    opts = {
      filetypes = filetype,
    },
  },
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
