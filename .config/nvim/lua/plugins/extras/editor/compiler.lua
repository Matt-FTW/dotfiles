return {
  {
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = { "stevearc/overseer.nvim" },
    opts = {},
    -- stylua: ignore
    keys = {
      { "<F3>", "<cmd>CompilerOpen<cr>", desc = "Open Compiler" },
      { "<S-F3>", function() vim.cmd("CompilerStop") vim.cmd("CompilerRedo") end, desc = "Redo Compiler" },
      { "<F4>", "<cmd>CompilerToggleResults<cr>", desc = "Toggle Compiler Results" },
    },
  },
  {
    "stevearc/overseer.nvim",
    cmd = {
      "OverseerOpen",
      "OverseerClose",
      "OverseerToggle",
      "OverseerSaveBundle",
      "OverseerLoadBundle",
      "OverseerDeleteBundle",
      "OverseerRunCmd",
      "OverseerRun",
      "OverseerInfo",
      "OverseerBuild",
      "OverseerQuickAction",
      "OverseerTaskAction ",
      "OverseerClearCache",
    },
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 15,
        max_height = 15,
        default_detail = 1,
      },
    },
  },
}
