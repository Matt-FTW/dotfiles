return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    vscode = false,
    dependencies = {
      "Weissle/persistent-breakpoints.nvim",
      vscode = false,
      event = "LazyFile",
      keys = {
        { "<leader>dbd", "<cmd>PBClearAllBreakpoints<cr>", desc = "Delete All Breakpoints" },
        { "<leader>dbB", "<cmd>PBSetConditionalBreakpoint<cr>", desc = "Breakpoint Condition" },
        { "<leader>dbb", "<cmd>PBToggleBreakpoint<cr>", desc = "Toggle Breakpoint" },
        { "<F2>", "<cmd>PBToggleBreakpoint<cr>", desc = "Toggle Breakpoint" },
      },
      opts = {
        load_breakpoints_event = { "BufReadPost" },
      },
    },
    keys = {
      { "<F2>", false },
      { "<leader>dB", false },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>db", group = "breakpoints", icon = " " },
      },
    },
  },
}
