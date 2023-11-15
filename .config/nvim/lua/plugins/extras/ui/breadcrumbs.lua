local version = vim.fn.has("nvim-0.10")

if version then
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
  }
else
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
      opts = {
        theme = "catppuccin-macchiato",
      },
    },
  }
end
