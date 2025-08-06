local prefix = "<leader>d"

return {
  { import = "lazyvim.plugins.extras.dap.core" },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "igorlfs/nvim-dap-view",
      opts = {},
      config = function(_, opts)
        local dap = require("dap")
        dap.listeners.before.attach.dapui_config = function()
          vim.cmd("DapViewOpen")
        end
        dap.listeners.before.launch.dapui_config = function()
          vim.cmd("DapViewOpen")
        end
        dap.listeners.before.event_terminated.dapui_config = function()
          vim.cmd("DapViewClose")
        end
        dap.listeners.before.event_exited.dapui_config = function()
          vim.cmd("DapViewClose")
        end
      end,
      keys = {
        { prefix .. "u", "<cmd>DapViewToggle<cr>", desc = "Dap UI" },
      },
    },
    -- stylua: ignore
    keys = {
      { prefix .. "O", function() require("dap").step_out() end, desc = "Debug: Step out" },
      { prefix .. "o", function() require("dap").step_over() end, desc = "Debug: Step over" },
      { "<F5>", function() require("dap").continue() end, desc = "Debug: Continue" },
      { "<F10>", function() require("dap").step_over() end, desc = "Debug: Step over" },
      { "<F11>", function() require("dap").step_into() end, desc = "Debug: Step into" },
      { "<F12>", function() require("dap").step_out() end, desc = "Debug: Step out" },
      { "<F2>", function() require("dap").toggle_breakpoint() end, desc = "Debug: Toggle breakpoint" },
      { "<S-F2>", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
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
