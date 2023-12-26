return {
  {
    "andrewferrier/debugprint.nvim",
    opts = {
      create_keymaps = false,
    },
    -- stylua: ignore
    keys = {
      { "<Leader>ddl", function() return require("debugprint").debugprint() end, desc = "Print under current line", expr = true },
      { "<Leader>ddL", function() return require("debugprint").debugprint({ above = true }) end, desc = "Print above current line", expr = true },
      {
        "<Leader>ddv",
        function() return require("debugprint").debugprint({ variable = true }) end,
        desc = "Print variable under current line",
        expr = true,
      },
      {
        "<Leader>ddV",
        function() return require("debugprint").debugprint({ above = true, variable = true }) end,
        desc = "Print variable above current line",
        expr = true,
      },
      { "<Leader>ddd", function() return require("debugprint").deleteprints() end, desc = "Delete all prints" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>dd"] = { name = "debugPrint" },
      },
    },
  },
}
