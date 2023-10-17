return {
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    event = "BufRead",
    enabled = false,
    opts = {
      theme = "catppuccin-macchiato",
    },
  },
}
