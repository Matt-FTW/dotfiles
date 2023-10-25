return {
  "mawkler/modicator.nvim",
  event = "BufReadPost",
  init = function()
    -- These are required for Modicator to work
    vim.o.cursorline = true
    vim.o.number = true
    vim.o.termguicolors = true
  end,
  opts = {},
}
