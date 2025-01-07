return {
  { import = "lazyvim.plugins.extras.editor.fzf" },
  {
    "ibhagwan/fzf-lua",
    opts = {
      previewers = {
        builtin = {
          syntax_limit_b = 1024 * 100, -- 100KB
        },
      },
    },
    keys = {
      { "<leader>sA", "<cmd>FzfLua treesitter<cr>", desc = "Treesiter Symbols" },
      { "<leader>gr", "<cmd>FzfLua git_branches<cr>", desc = "Branches" },
      { "<leader>S", "<cmd>FzfLua spell_suggest<cr>", desc = "Spelling" },
    },
  },
}
