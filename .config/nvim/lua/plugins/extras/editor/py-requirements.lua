return {
  "MeanderingProgrammer/py-requirements.nvim",
  event = {
    "BufRead requirements.txt",
  },
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    {
      "hrsh7th/nvim-cmp",
      dependencies = {},
      opts = function(_, opts)
        table.insert(opts.sources, { name = "py-requirements" })
      end,
    },
  },
  opts = function()
    require("py-requirements").setup({})
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "requirements",
      },
    })
  end,
}
