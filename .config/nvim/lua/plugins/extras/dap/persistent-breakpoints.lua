local prefix = "<leader>db"

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
        { prefix .. "d", "<cmd>PBClearAllBreakpoints<cr>", desc = "Delete All Breakpoints" },
        { prefix .. "B", "<cmd>PBSetConditionalBreakpoint<cr>", desc = "Breakpoint Condition" },
        { prefix .. "b", "<cmd>PBToggleBreakpoint<cr>", desc = "Toggle Breakpoint" },
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
        { prefix, group = "breakpoints", icon = " " },
      },
    },
  },
}
