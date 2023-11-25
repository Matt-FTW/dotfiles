local Util = require("lazyvim.util")

return {
  "nvim-telescope/telescope-dap.nvim",
  config = function()
    Util.on_load("telescope.nvim", function()
      require("telescope").load_extension("dap")
    end)
  end,
  keys = {
    {
      "<leader>dm",
      "<cmd>Telescope dap commands<CR>",
      desc = "Commands",
    },
    {
      "<leader>df",
      "<cmd>Telescope dap frames<CR>",
      desc = "Frames",
    },
    {
      "<leader>dG",
      "<cmd>Telescope dap configurations<CR>",
      desc = "Configurations",
    },
    {
      "<leader>dL",
      "<cmd>Telescope dap list_breakpoints<CR>",
      desc = "List Breakpoints",
    },
    {
      "<leader>dv",
      "<cmd>Telescope dap variables<CR>",
      desc = "Variables",
    },
  },
}
