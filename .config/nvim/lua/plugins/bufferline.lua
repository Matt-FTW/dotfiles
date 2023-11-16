return {
  "akinsho/bufferline.nvim",
  keys = {
    { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
    { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
  },
  opts = {
    options = {
      buffer_close_icon = "",
      modified_icon = "",
      close_icon = "",
      color_icons = true,
      separator_style = "slope",
    },
  },
}
