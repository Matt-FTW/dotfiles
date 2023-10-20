return {
  {
    "ThePrimeagen/refactoring.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    opts = {},
        -- stylua: ignore
    keys = {
      { "<leader>Rs", function() require("telescope").extensions.refactoring.refactors() end, mode = { "v" }, desc = "Refactor Options", },
      { "<leader>cRi", function() require("refactoring").refactor("Inline Variable") end, mode = {"n","v"}, desc =  "Inline Variable" },
      { "<leader>cRb", function() require('refactoring').refactor('Exract Block') end, mode = {"n"}, desc = "Extract Block" },
      { "<leader>cRf", function() require('refactoring').refactor('Exract Block To File') end, mode = {"n"}, desc = "Extract Block to File" },
      { "<leader>cRP", function() require('refactoring').debug.printf({below = false}) end,  mode = {"n"}, desc = "Debug Print" },
      { "<leader>cRp", function() require('refactoring').debug.print_var({normal = true}) end, mode = {"n"}, desc = "Debug Print Variable" },
      { "<leader>cRc", function() require('refactoring').debug.cleanup({}) end, mode = {"n"}, desc = "Debug Cleanup" },
      { "<leader>cRf", function() require('refactoring').refactor('Extract Function') end,  mode = {"v"}, desc = "Extract Function" },
      { "<leader>cRF", function() require('refactoring').refactor('Extract Function to File') end, mode = {"v"}, desc =  "Extract Function to File" },
      { "<leader>cRx", function() require('refactoring').refactor('Extract Variable') end, mode = {"v"}, desc = "Extract Variable" },
      { "<leader>cRp", function() require('refactoring').debug.print_var({}) end, mode = {"v"}, desc =  "Debug Print Variable" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>cR"] = { name = "+refactor" },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      require("telescope").load_extension("refactoring")
    end,
  },
}
