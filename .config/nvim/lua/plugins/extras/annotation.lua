return {
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = {
      snippet_engine = "luasnip",
      enabled = true,
    },
    keys = {
      {
        "<leader>ad",
        function()
          require("neogen").generate()
        end,
        desc = "Default Annotation",
      },
      {
        "<leader>ac",
        function()
          require("neogen").generate({ type = "class" })
        end,
        desc = "Class",
      },
      {
        "<leader>af",
        function()
          require("neogen").generate({ type = "func" })
        end,
        desc = "Function",
      },
      {
        "<leader>at",
        function()
          require("neogen").generate({ type = "type" })
        end,
        desc = "Type",
      },
      {
        "<leader>aF",
        function()
          require("neogen").generate({ type = "file" })
        end,
        desc = "File",
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>a"] = { name = "+annotation" },
      },
    },
  },
}
