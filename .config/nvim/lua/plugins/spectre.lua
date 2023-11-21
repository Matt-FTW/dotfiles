return {
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = {},
    -- stylua: ignore
    keys = {
      { "<leader>srg", function() require("spectre").toggle() end, desc = "Globally" },
      { "<leader>srW", mode = { "n" }, function() require("spectre").open_visual({ select_word = true }) end, desc = "Word Globally" },
      { "<leader>srW", mode = { "v" }, function() require("spectre").open_visual() end, desc = "Word Globally" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>sr"] = { name = "+replace" },
      },
    },
  },
}
