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
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>cc"] = { name = "+compile" },
      },
    },
  },
}
