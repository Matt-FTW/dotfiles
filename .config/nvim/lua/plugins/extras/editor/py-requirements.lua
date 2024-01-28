return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "MeanderingProgrammer/py-requirements.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = function()
      require("py-requirements").setup({})
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "requirements",
        },
      })
    end,
  },
  opts = function(_, opts)
    table.insert(opts.sources, { name = "py-requirements" })
  end,
}
