return {
  "Wansmer/symbol-usage.nvim",
  event = function()
    if vim.fn.has("nvim-0.10") == 1 then
      return "LspAttach"
    else
      return "BufRead"
    end
  end,
  opts = {},
}
