return {
  "folke/trouble.nvim",
  opts = {
    auto_close = true,
    focus = true,
    keys = {
      e = "jump",
      l = "fold_open",
      L = "fold_open_recursive",
      h = "fold_close",
      H = "fold_close_recursive",
    },
    modes = {
      test = {
        mode = "diagnostics",
        preview = {
          type = "split",
          relative = "win",
          position = "right",
          size = 0.3,
        },
      },
    },
  },
}
