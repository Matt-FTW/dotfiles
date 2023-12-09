return {
  {
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen" },
    keys = { { "<leader>cs", "<cmd>Outline<CR>", desc = "Symbols Outline" } },
    opts = {
      outline_window = {
        show_symbol_lineno = true,
        auto_jump = true,
        jump_highlight_duration = 150,
      },
      symbol_folding = {
        autofold_depth = 1,
      },
      symbols = {
        filter = require("lazyvim.config").kind_filter,
      },
    },
  },
  {
    "folke/edgy.nvim",
    optional = true,
    opts = function(_, opts)
      opts.right = opts.right or {}
      table.insert(opts.right, {
        title = "Symbols Outline",
        ft = "Outline",
        pinned = true,
        open = "OutlineOpen",
        size = { width = 0.15 },
      })
    end,
  },
}
