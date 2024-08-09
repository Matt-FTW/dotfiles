local prefix = "<leader>sr"

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
      { prefix .. "g", function() require("spectre").toggle() end, desc = "Globally" },
      { prefix .. "G", mode = { "n" }, function() require("spectre").open_visual({ select_word = true }) end, desc = "Word Globally" },
      { prefix .. "G", mode = { "v" }, function() require("spectre").open_visual() end, desc = "Word Globally" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { prefix, group = "replace", icon = " " },
      },
    },
  },
  {
    "MagicDuck/grug-far.nvim",
    enabled = false,
  },
}
