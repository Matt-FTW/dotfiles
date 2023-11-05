return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      defaults = {
        ["<leader>dP"] = { name = "+python" },
        ["<leader>cL"] = { name = "+lsp" },
        ["<leader>ci"] = { name = "+info" },
      },
    },
  },
}
