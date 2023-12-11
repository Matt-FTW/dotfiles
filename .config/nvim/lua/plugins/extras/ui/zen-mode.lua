local Util = require("lazyvim.util")

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
        if vim.fn.exists(":LspLensOff") ~= 0 then
          vim.cmd("LspLensOff")
        end
        if vim.fn.exists(":NvimContextVtToggle") ~= 0 then
          vim.cmd("NvimContextVtToggle")
        end
        Util.toggle.inlay_hints()
        vim.cmd("Gitsigns toggle_current_line_blame")
      end,
      on_close = function()
        vim.opt.laststatus = 3
        if vim.fn.exists(":SatelliteEnable") ~= 0 then
          vim.cmd("SatelliteEnable")
        end
        if vim.fn.exists(":ScrollViewEnable") ~= 0 then
          vim.cmd("ScrollViewEnable")
        end
        if vim.fn.exists(":LspLensOn") ~= 0 then
          vim.cmd("LspLensOn")
        end
        if vim.fn.exists(":NvimContextVtToggle") ~= 0 then
          vim.cmd("NvimContextVtToggle")
        end
        Util.toggle.inlay_hints()
        vim.cmd("Gitsigns toggle_current_line_blame")
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
