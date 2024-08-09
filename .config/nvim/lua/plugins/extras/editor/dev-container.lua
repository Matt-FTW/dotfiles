local prefix = "<leader>o"

return {
  {
    "https://codeberg.org/esensar/nvim-dev-container",
    cmd = {
      "DevcontainerStart",
      "DevcontainerStop",
      "DevcontainerLogs",
      "DevcontainerEditNearestConfig",
      "DevcontainerAttach",
      "DevcontainerExec",
      "DevcontainerStopAll",
      "DevcontainerRemoveAll",
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {},
    keys = {
      { prefix .. "s", "<cmd>DevcontainerStart<cr>", desc = "Start" },
      { prefix .. "S", "<cmd>DevcontainerStop<cr>", desc = "Stop" },
      { prefix .. "l", "<cmd>DevcontainerLogs<cr>", desc = "Log" },
      { prefix .. "c", "<cmd>DevcontainerEditNearestConfig<cr>", desc = "Config" },
      { prefix .. "a", "<cmd>DevcontainerAttach<cr>", desc = "Attach" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader><S-Tab>", group = "containers", icon = " " },
      },
    },
  },
}
