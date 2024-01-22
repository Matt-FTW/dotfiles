return {
  { import = "lazyvim.plugins.extras.test.core" },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>t"] = { name = "󰙨 test" },
      },
    },
  },
}
