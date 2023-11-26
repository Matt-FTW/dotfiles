return {
  "gbprod/yanky.nvim",
  optional = true,
  -- stylua: ignore
  keys = {
    {"<leader>sy", function() require("telescope").extensions.yank_history.yank_history({}) end, mode = {"n", "v"}, desc = "Yank History"},
  },
}
