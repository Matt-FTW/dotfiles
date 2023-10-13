return {
  {
    "aurum77/live-server.nvim",
    build = function()
      require("live_server.util").install()
    end,
    cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
    keys = {
      { "<leader>cL", "<cmd>LiveServer<CR>", desc = "Toggle LiveServer" },
    },
  },
}
