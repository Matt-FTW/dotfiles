return {
  "mfussenegger/nvim-dap",
  opts = {
    defaults = {
      fallback = {
        external_terminal = {
          command = "/usr/bin/kitty",
          args = { "--class", "kitty-dap", "--hold", "--detach", "nvim-dap", "-c", "DAP" },
        },
      },
    },
  },
  keys = {
    {
      "<F5>",
      function()
        require("dap").continue()
      end,
      desc = "Debug: Continue",
    },
    {
      "<F10>",
      function()
        require("dap").step_over()
      end,
      desc = "Debug: Step over",
    },
    {
      "<F11>",
      function()
        require("dap").step_into()
      end,
      desc = "Debug: Step into",
    },
    {
      "<F12>",
      function()
        require("dap").step_out()
      end,
      desc = "Debug: Step out",
    },
    {
      "<F9>",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Debug: Toggle breakpoint",
    },
  },
}
