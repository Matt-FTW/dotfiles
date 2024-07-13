return {
  { import = "lazyvim.plugins.extras.coding.neogen" },
  {
    "danymat/neogen",
    -- stylua: ignore
    keys = {
      { "<leader>ad", function() require("neogen").generate() end, desc = "Default Annotation" },
      { "<leader>aC", function() require("neogen").generate({ type = "class" }) end, desc = "Class" },
      { "<leader>af", function() require("neogen").generate({ type = "func" }) end, desc = "Function" },
      { "<leader>at", function() require("neogen").generate({ type = "type" }) end, desc = "Type" },
      { "<leader>aF", function() require("neogen").generate({ type = "file" }) end, desc = "File" },
      { "<leader>cn", false },
    },
  },
  {
    "Zeioth/dooku.nvim",
    cmd = { "DookuGenerate", "DookuOpen", "DookuAutoSetup" },
    opts = {},
    -- stylua: ignore
    keys = {
      { "<leader>ag", "<Cmd>DookuGenerate<CR>", desc = "Generate HTML Docs" },
      { "<leader>ao", "<Cmd>DookuOpen<CR>", desc = "Open HTML Docs" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>a", group = "annotation/snippets", icon = " " },
      },
    },
  },
}
