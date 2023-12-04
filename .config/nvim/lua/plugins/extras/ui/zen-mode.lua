return {
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    keys = { { "<leader>uz", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" } },
    opts = {
      on_open = function(_)
        vim.opt.laststatus = 0
        if vim.fn.exists(":SatelliteDisable") ~= 0 then
          vim.cmd("SatelliteDisable")
        end
        if vim.fn.exists(":ScrollViewDisable") ~= 0 then
          vim.cmd("ScrollViewDisable")
        end
      end,
      on_close = function()
        vim.opt.laststatus = 3
        if vim.fn.exists(":SatelliteEnable") ~= 0 then
          vim.cmd("SatelliteEnable")
        end
        if vim.fn.exists(":ScrollViewEnable") ~= 0 then
          vim.cmd("ScrollViewEnable")
        end
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
