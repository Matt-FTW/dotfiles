return {
  { import = "lazyvim.plugins.extras.lang.markdown" },
  {
    "gaoDean/autolist.nvim",
    ft = {
      "markdown",
      "text",
      "tex",
      "plaintex",
      "norg",
    },
    opts = {},
    keys = {
      { "<CR>", "<CR><cmd>AutolistNewBullet<cr>", mode = { "i" } },
      { "o", "o<cmd>AutolistNewBullet<cr>", mode = { "n" } },
      { "O", "O<cmd>AutolistNewBulletBefore<cr>", mode = { "n" } },
      { "<CR>", "<cmd>AutolistToggleCheckbox<cr><CR>", mode = { "n" } },
      { "<C-r>", "<cmd>AutolistRecalculate<cr>", mode = { "n" } },

      { "].", "<cmd>AutolistCycleNext<cr>", mode = { "n" }, desc = "Next List Type" },
      { "[.", "<cmd>AutolistCyclePrev<cr>", mode = { "n" }, desc = "Prev List Type" },

      { ">>", ">><cmd>AutolistRecalculate<cr>", mode = { "n" } },
      { "<<", "<<<cmd>AutolistRecalculate<cr>", mode = { "n" } },
      { "dd", "dd<cmd>AutolistRecalculate<cr>", mode = { "n" } },
      { "d", "d<cmd>AutolistRecalculate<cr>", mode = { "v" } },
    },
  },
  {
    "antonk52/markdowny.nvim",
    ft = { "markdown", "txt" },
    opts = {
      filetypes = { "markdown", "txt" },
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
      preset = "lazy",
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
