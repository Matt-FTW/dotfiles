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
  {  "<leader>r", function() require('telescope').extensions.refactoring.refactors() end, mode = { "n", "x" }, desc = "Refactor" },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      require("telescope").load_extension("refactoring")
    end,
  },
}
