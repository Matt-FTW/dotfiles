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
      -- stylua: ignore
      keys = {
        { prefix .. "u", "<cmd>DapViewToggle<cr>", desc = "Dap UI" },
        { prefix .. "a", function() require("dap-view").add_expr() end, desc = "Add Expression" },
      },
    },
    -- stylua: ignore
    keys = {
      { prefix .. "O", function() require("dap").step_out() end, desc = "Debug: Step out" },
      { prefix .. "o", function() require("dap").step_over() end, desc = "Debug: Step over" },
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
