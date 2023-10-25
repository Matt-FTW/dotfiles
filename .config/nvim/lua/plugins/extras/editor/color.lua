return {
  "uga-rosa/ccc.nvim",
  event = { "BufRead" },
  cmd = { "CccPick", "CccConvert", "CccHighlighterEnable", "CccHighlighterDisable", "CccHighlighterToggle" },
  keys = {
    { "<leader>uC", "<cmd>CccHighlighterToggle<cr>", desc = "Toggle Colorizer" },
    { "<S-C>", "<cmd>CccConvert<cr>", desc = "Convert color" },
    { "<C-c>", "<cmd>CccPick<cr>", desc = "Pick Color" },
  },
  opts = {
    highlighter = {
      auto_enable = true,
      lsp = true,
    },
  },
}
