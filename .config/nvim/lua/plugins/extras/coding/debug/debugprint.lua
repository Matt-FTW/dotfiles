return {
  {
    "andrewferrier/debugprint.nvim",
    opts = {
      create_keymaps = false,
    },
    keys = {
      {
        "<Leader>dLl",
        function()
          require("debugprint").debugprint()
        end,
        desc = "Log under current line",
      },
      {
        "<Leader>dLL",
        function()
          require("debugprint").debugprint({ above = true })
        end,
        desc = "Log above current line",
      },
      {
        "<Leader>dLv",
        function()
          require("debugprint").debugprint({ variable = true })
        end,
        desc = "Log variable under current line",
      },
      {
        "<Leader>dLV",
        function()
          require("debugprint").debugprint({ above = true, variable = true })
        end,
        desc = "Log variable above current line",
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>dL"] = { name = "+log" },
      },
    },
  },
}
