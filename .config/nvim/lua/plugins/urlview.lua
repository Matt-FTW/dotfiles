return {
  {
    "axieax/urlview.nvim",
    cmd = { "UrlView" },
    keys = { { "<leader>su", "<cmd>UrlView<cr>", desc = "Search Urls" } },
    opts = {
      default_picker = "telescope",
    },
  },
}
