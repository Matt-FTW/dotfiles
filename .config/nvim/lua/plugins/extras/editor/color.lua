return {
  "uga-rosa/ccc.nvim",
  event = { "BufRead" },
  cmd = { "CccPick", "CccConvert", "CccHighlighterEnable", "CccHighlighterDisable", "CccHighlighterToggle" },
  keys = {
    { "<leader>uc", "<cmd>CccHighlighterToggle<cr>", desc = "Toggle Colorizer" },
    { "<A-C>", "<cmd>CccConvert<cr>", desc = "Convert color" },
    { "<S-c>", "<cmd>CccPick<cr>", desc = "Pick Color" },
  },
  opts = {
    highlighter = {
      auto_enable = true,
      lsp = true,
    },
  },
}
