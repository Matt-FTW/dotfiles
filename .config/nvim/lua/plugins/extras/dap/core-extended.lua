local prefix = "<leader>d"

return {
  { import = "lazyvim.plugins.extras.dap.core" },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "igorlfs/nvim-dap-view",
      opts = {
        winbar = {
          sections = { "watches", "scopes", "exceptions", "breakpoints", "threads", "repl", "sessions", "console" },
          default_section = "scopes",
        },
        windows = {
          terminal = {
            size = 0.2,
            position = "left",
            hide = {},
          },
        },
        auto_toggle = true,
        virtual_text = {
          enabled = true,
        },
      },
      -- stylua: ignore
      keys = {
        { prefix .. "u", "<cmd>DapViewToggle<cr>", desc = "Dap UI" },
        { prefix .. "a", function() require("dap-view").add_expr() end, desc = "Add Expression" },
        { prefix .. "v", "<cmd>DapViewVirtualTextToggle<cr>", desc = "Toggle Virtual Line" },
      },
    },
    -- stylua: ignore
    keys = {
      { prefix .. "O", function() require("dap").step_out() end, desc = "Debug: Step out" },
      { prefix .. "o", function() require("dap").step_over() end, desc = "Debug: Step over" },
    },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    enabled = false,
    -- stylua: ignore
    keys = {
      { prefix .. "v", "<cmd>DapVirtualTextToggle<cr>", desc = "Toggle Virtual Line" },
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    enabled = false,
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    -- stylua: ignore
    keys = {
      { "<leader>tD", function() require("neotest").run.run_last({ strategy = "dap" }) end, desc = "Debug Last" },
    },
  },
}
