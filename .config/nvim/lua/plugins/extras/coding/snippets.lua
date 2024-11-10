local prefix = "<leader>a"

return {
  {
    "chrisgrieser/nvim-scissors",
    opts = {
      jsonFormatter = "jq",
    },
    -- stylua: ignore
    keys = {
      { prefix .. "S", function() require("scissors").editSnippet() end, desc = "Edit Snippets" },
      { prefix .. "s", mode = { "n", "v" }, function() require("scissors").addNewSnippet() end, desc = "Add Snippets" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { prefix, group = "annotation/snippets", icon = " " },
      },
    },
  },
}
