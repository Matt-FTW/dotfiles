return {
  {
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen" },
    keys = { { "<leader>cs", "<cmd>Outline<CR>", desc = "Symbols Outline" } },
    opts = {
      outline_window = {
        show_symbol_lineno = true,
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
        ft = "outline",
        pinned = true,
        open = "Outline",
      })
    end,
  },
}
