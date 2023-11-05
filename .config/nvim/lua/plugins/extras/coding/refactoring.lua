local Util = require("lazyvim.util")

return {
  "ThePrimeagen/refactoring.nvim",
  requires = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-treesitter/nvim-treesitter" },
  },
  opts = {},
  config = function(_, opts)
    Util.on_load("telescope.nvim", function()
      require("telescope").load_extension("refactoring")
    end)
  end,
        -- stylua: ignore
    keys = {
  {  "<leader>cR", function() require('telescope').extensions.refactoring.refactors() end, mode = { "n", "x" }, desc = "Refactor" },
    },
}
