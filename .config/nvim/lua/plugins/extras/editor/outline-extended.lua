return {
  { import = "lazyvim.plugins.extras.editor.outline" },
  {
    "hedyhli/outline.nvim",
    opts = {
      outline_window = {
        show_symbol_lineno = true,
        auto_jump = true,
        jump_highlight_duration = 150,
      },
      symbol_folding = {
        autofold_depth = 1,
      },
    },
  },
}
