return {
  "axieax/urlview.nvim",
  cmd = { "UrlView" },
  keys = { { "<leader>sU", "<cmd>UrlView<cr>", desc = "Search Urls" } },
  opts = {
    default_picker = "telescope",
  },
}
