return {
  {
    "Bekaboo/dropbar.nvim", -- NOTE: NVIM >= 10.0
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
    "utilyre/barbecue.nvim", -- NOTE: NVIM < 10.0
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
