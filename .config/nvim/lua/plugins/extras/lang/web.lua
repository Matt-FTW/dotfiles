return {
  {
    "aurum77/live-server.nvim",
    build = function()
      require("live_server.util").install()
    end,
    cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
    keys = {
      { "<leader>cV", "<cmd>LiveServer<CR>", desc = "Live Server" },
    },
  },
  {
    "barrett-ruth/import-cost.nvim",
    build = "sh install.sh yarn",
    event = "BufReadPost",
    config = true,
  },
}
