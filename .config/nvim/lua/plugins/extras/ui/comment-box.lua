local prefix = "<leader>ac"

return {
  {
    "LudoPinelli/comment-box.nvim",
    opts = {},
    vscode = true,
    keys = {
      { prefix .. "b", "<cmd>CBccbox<CR>", mode = { "n", "v" }, desc = "Comment Box" },
      { prefix .. "t", "<cmd>CBllline<CR>", mode = { "n", "v" }, desc = "Tiled Line" },
      { prefix .. "l", "<cmd>CBline<CR>", desc = "Line" },
      { prefix .. "m", "<cmd>CBllbox14<CR>", mode = { "n", "v" }, desc = "Marked" },
      { prefix .. "c", "<cmd>CBcatalog<CR>", desc = "Catalog" },
      { prefix .. "d", "<cmd>CBd<CR>", mode = { "n", "v" }, desc = "Delete Comment Style" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>A", group = "annotation/snippets", icon = " " },
        { prefix, group = "comments", icon = " " },
      },
    },
  },
}
