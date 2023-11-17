return {
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    keys = { { "<leader>uz", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" } },
    opts = {
      plugins = {
        scrollview = { enabled = false },
        satellite = { enabled = false },
        gitsigns = { enabled = true },
        dropbar = { enabled = false },
        barbecue = { enabled = false },
      },
      on_open = function(_)
        vim.opt.laststatus = 0
        vim.o.winbar = ""
      end,
      on_close = function()
        vim.opt.laststatus = 3
      end,
    },
  },
  {
    "folke/twilight.nvim",
    cmd = "Twilight",
    keys = { { "<leader>uZ", "<cmd>Twilight<cr>", desc = "Toggle Twilight" } },
    opts = {},
  },
}
