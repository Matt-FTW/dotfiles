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
      { "<leader>os", "<cmd>DevcontainerStart<cr>", desc = "Start" },
      { "<leader>oS", "<cmd>DevcontainerStop<cr>", desc = "Stop" },
      { "<leader>ol", "<cmd>DevcontainerLogs<cr>", desc = "Log" },
      { "<leader>oc", "<cmd>DevcontainerEditNearestConfig<cr>", desc = "Config" },
      { "<leader>oa", "<cmd>DevcontainerAttach<cr>", desc = "Attach" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>o"] = { name = " c[o]ntainers" },
      },
    },
  },
}
