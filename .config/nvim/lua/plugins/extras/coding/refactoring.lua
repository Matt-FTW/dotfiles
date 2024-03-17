return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-treesitter/nvim-treesitter" },
  },
  opts = {},
  -- stylua: ignore
  keys = {
    { "<leader>cR", function() require("refactoring").select_refactor() end, mode = { "n", "x", "v" }, desc = "Refactor" },
  },
}
