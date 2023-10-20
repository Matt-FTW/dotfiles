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
        { noremap = true, silent = true, desc = "Open Compiler", mode = { "n" } },
      },
      {
        "<leader>ccR",
        function()
          vim.cmd("CompilerStop")
          vim.cmd("CompilerRedo")
        end,
        { noremap = true, silent = true, desc = "Redo Compiler", mode = { "n" } },
      },
      {
        "<leader>ccr",
        "<cmd>CompilerToggleResults<cr>",
        { noremap = true, silent = true, desc = "Toggle Compiler Results", mode = { "n" } },
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
