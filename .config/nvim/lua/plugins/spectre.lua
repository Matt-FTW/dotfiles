return {
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = {},
    keys = {
      {
        "<leader>srf",
        function()
          require("spectre").toggle()
        end,
        desc = "Search globally",
      },
      {
        "<leader>srw",
        mode = { "n" },
        function()
          require("spectre").open_visual({ select_word = true })
        end,
        desc = "Current Word",
      },
      {
        "<leader>srw",
        mode = { "v" },
        function()
          require("spectre").open_visual()
        end,
        desc = "Current Word",
      },
      {
        "<leader>srW",
        mode = { "n" },
        function()
          require("spectre").open_file_search({ select_word = true })
        end,
        desc = "Word on Current File",
      },
      {
        "<leader>src",
        mode = { "n" },
        function()
          require("spectre").open_file_search({})
        end,
        desc = "Current File",
      },
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
