return {
  {
    "chrisgrieser/nvim-scissors",
    dependencies = {
      "rcarriga/nvim-notify",
    },
    opts = {
      jsonFormatter = "jq",
    },
    -- stylua: ignore
    keys = {
      { "<leader>aS", function() require("scissors").editSnippet() end, desc = "Edit Snippets" },
      { "<leader>as", mode = { "n", "v" }, function() require("scissors").addNewSnippet() end, desc = "Add Snippets" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>a"] = { name = " annotation/snippets" },
      },
    },
  },
}
