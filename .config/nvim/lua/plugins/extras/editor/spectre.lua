return {
  {
    "nvim-pack/nvim-spectre",
    build = false,
    cmd = "Spectre",
    opts = {
      open_cmd = "noswapfile vnew",
      default = {
        find = {
          cmd = "rg",
        },
        replace = {
          cmd = "sd",
        },
      },
      use_trouble_qf = true,
    },
    -- stylua: ignore
    keys = {
      { "<leader>srg", function() require("spectre").toggle() end, desc = "Globally" },
      { "<leader>srG", mode = { "n" }, function() require("spectre").open_visual({ select_word = true }) end, desc = "Word Globally" },
      { "<leader>srG", mode = { "v" }, function() require("spectre").open_visual() end, desc = "Word Globally" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>sr", group = "replace", icon = " " },
      },
    },
  },
  {
    "MagicDuck/grug-far.nvim",
    enabled = false,
  },
}
