return {
  {
    "LudoPinelli/comment-box.nvim",
    opts = {},
    vscode = true,
    keys = {
      { "<leader>acb", "<cmd>CBccbox<CR>", mode = { "n", "v" }, desc = "Comment Box" },
      { "<leader>act", "<cmd>CBllline<CR>", mode = { "n", "v" }, desc = "Tiled Line" },
      { "<leader>acl", "<cmd>CBline<CR>", desc = "Line" },
      { "<leader>acm", "<cmd>CBllbox14<CR>", mode = { "n", "v" }, desc = "Marked" },
      { "<leader>acc", "<cmd>CBcatalog<CR>", desc = "Catalog" },
      { "<leader>acd", "<cmd>CBd<CR>", mode = { "n", "v" }, desc = "Delete Comment Style" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>a", group = "annotation/snippets", icon = " " },
        { "<leader>ac", group = "comments", icon = " " },
      },
    },
  },
}
