return {
  {
    "andrewferrier/debugprint.nvim",
    opts = {
      create_keymaps = false,
    },
    keys = {
      {
        "<Leader>ddl",
        function()
          require("debugprint").debugprint()
        end,
        desc = "Print under current line",
      },
      {
        "<Leader>ddL",
        function()
          require("debugprint").debugprint({ above = true })
        end,
        desc = "Print above current line",
      },
      {
        "<Leader>ddv",
        function()
          require("debugprint").debugprint({ variable = true })
        end,
        desc = "Print variable under current line",
      },
      {
        "<Leader>ddV",
        function()
          require("debugprint").debugprint({ above = true, variable = true })
        end,
        desc = "Print variable above current line",
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>dd"] = { name = "+debugPrint" },
      },
    },
  },
}
