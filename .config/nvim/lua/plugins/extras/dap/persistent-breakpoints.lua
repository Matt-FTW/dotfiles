return {
  "Weissle/persistent-breakpoints.nvim",
  event = "BufReadPost",
  keys = {
    { "<leader>dd", "<cmd>PBClearAllBreakpoints<cr>", desc = "Delete All Breakpoints" },
    { "<leader>dB", "<cmd>PBSetConditionalBreakpoint<cr>", desc = "Breakpoint Condition" },
    { "<leader>db", "<cmd>PBToggleBreakpoint<cr>", desc = "Toggle Breakpoint" },
  },
  opts = {
    load_breakpoints_event = { "BufReadPost" },
  },
}
