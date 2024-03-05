local Util = require("lazyvim.util")
local executeCommandIfExists = function(command)
  if vim.fn.exists(command) ~= 0 then
    vim.cmd(command)
  end
end

return {
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
    opts = {
      on_open = function(_)
        vim.opt.laststatus = 0
        executeCommandIfExists(":SatelliteDisable")
        executeCommandIfExists(":ScrollViewDisable")
        executeCommandIfExists(":LspLensOff")
        executeCommandIfExists(":NvimContextVtDisable")
        executeCommandIfExists(":IBLDisable")
        Util.toggle.inlay_hints()
        executeCommandIfExists(":Gitsigns toggle_current_line_blame")
        executeCommandIfExists(":CccHighlighterDisable")
      end,
      on_close = function()
        vim.opt.laststatus = 3
        executeCommandIfExists(":SatelliteEnable")
        executeCommandIfExists(":ScrollViewEnable")
        executeCommandIfExists(":LspLensOn")
        executeCommandIfExists(":NvimContextVtEnable")
        executeCommandIfExists(":IBLEnable")
        Util.toggle.inlay_hints()
        executeCommandIfExists(":Gitsigns toggle_current_line_blame")
        executeCommandIfExists(":CccHighlighterEnable")
      end,
    },
  },
  {
    "folke/twilight.nvim",
    cmd = "Twilight",
    keys = { { "<leader>Z", "<cmd>Twilight<cr>", desc = "Zen Twilight" } },
    opts = {},
  },
}
