return {
  "uga-rosa/ccc.nvim",
  ft = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "css", "scss", "sh" },
  cmd = { "CccPick", "CccConvert", "CccHighlighterEnable", "CccHighlighterDisable", "CccHighlighterToggle" },
  keys = {
    { "<leader>up", "<cmd>CccHighlighterToggle<cr>", desc = "Toggle Paint/Colorizer" },
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
