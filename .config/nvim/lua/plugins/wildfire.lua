return {
  {
    "sustech-data/wildfire.nvim",
    event = "VeryLazy",
    enabled = false,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("wildfire").setup()
    end,
  },
}
