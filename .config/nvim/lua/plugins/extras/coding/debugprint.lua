return {
  {
    "andrewferrier/debugprint.nvim",
    opts = {
      create_keymaps = false,
    },
    -- stylua: ignore
    keys = {
      { "<Leader>ddl", function() return require("debugprint").debugprint() end, desc = "Under Line", expr = true },
      { "<Leader>ddL", function() return require("debugprint").debugprint({ above = true }) end, desc = "Above Line", expr = true },
      {
        "<Leader>ddv",
        function() return require("debugprint").debugprint({ variable = true }) end,
        desc = "Variable Under Line",
        expr = true,
      },
      {
        "<Leader>ddV",
        function() return require("debugprint").debugprint({ above = true, variable = true }) end,
        desc = "Variable Above Line",
        expr = true,
      },
      { "<Leader>ddd", function() return require("debugprint").deleteprints() end, desc = "Delete All" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>dd", group = "debugPrint", icon = "󰐪 " },
      },
    },
  },
}
