return {
  {
    "Bekaboo/dropbar.nvim",
    event = "BufRead",
    opts = {
      sources = {
        terminal = {
          name = "",
        },
      },
    },
  },
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
