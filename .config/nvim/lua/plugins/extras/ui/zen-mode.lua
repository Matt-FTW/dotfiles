return {
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    keys = { { "<leader>uz", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" } },
    opts = {
      plugins = {
        scrollview = { enabled = false },
        satellite = { enabled = false },
        gitsigns = { enabled = false },
      },
    },
  },
  {
    "folke/twilight.nvim",
    cmd = "Twilight",
    keys = { { "<leader>uZ", "<cmd>Twilight<cr>", desc = "Toggle Twilight" } },
    opts = {},
  },
}
