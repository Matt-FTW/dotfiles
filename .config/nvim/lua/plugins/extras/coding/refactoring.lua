return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-treesitter/nvim-treesitter" },
  },
  opts = {
    show_success_message = true,
  },
  -- stylua: ignore
  keys = {
    { "<leader>cR", function() require("refactoring").select_refactor() end, mode = { "n", "x", "v" }, desc = "Refactor" },
    { "<leader>dv", function() require("refactoring").debug.print_var() end, mode = { "n", "x", "v" }, desc = "Print Variable" },
    { "<leader>dR", function() require("refactoring").debug.cleanup() end, desc = "Remove Printed Variables" },
  },
}
