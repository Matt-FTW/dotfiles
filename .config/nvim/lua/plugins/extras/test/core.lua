return {
  { import = "lazyvim.plugins.extras.test.core" },
  {
    "nvim-neotest/neotest",
  -- stylua: ignore
  keys = {
    { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Run Last Test" },
    { "<leader>tL", function() require("neotest").run.run_last({ strategy = "dap" }) end, desc = "Debug Last Test" },
    { "<leader>tw", "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>", desc = "Run Watch" },
  },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>t"] = { name = "󰙨 test" },
      },
    },
  },
}
