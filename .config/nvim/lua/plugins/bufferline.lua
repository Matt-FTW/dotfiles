return {
  "akinsho/bufferline.nvim",
  keys = {
    { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
    { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
  },
  opts = {
    options = {
      modified_icon = "",
      color_icons = true,
      separator_style = "slope",
    },
  },
}
