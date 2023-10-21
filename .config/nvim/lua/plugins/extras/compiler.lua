return {
  {
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = { "stevearc/overseer.nvim" },
    opts = {},
    keys = {
      {
        "<leader>ccc",
        "<cmd>CompilerOpen<cr>",
        desc = "Open Compiler",
      },
      {
        "<leader>ccR",
        function()
          vim.cmd("CompilerStop")
          vim.cmd("CompilerRedo")
        end,
        desc = "Redo Compiler",
      },
      {
        "<leader>ccr",
        "<cmd>CompilerToggleResults<cr>",
        desc = "Toggle Compiler Results",
      },
    },
  },
  {
    "stevearc/overseer.nvim",
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 15,
        max_height = 15,
        default_detail = 1,
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>cc"] = { name = "+compile" },
      },
    },
  },
}
