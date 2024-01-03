return {
  "Wansmer/symbol-usage.nvim",
  event = function()
    if vim.fn.has("nvim-0.10") == 1 then
      return "LspAttach"
    else
      return "BufRead"
    end
  end,
  opts = {
    vt_position = "end_of_line",
    text_format = function(symbol)
      if symbol.references then
        local usage = symbol.references <= 1 and "usage" or "usages"
        local num = symbol.references == 0 and "no" or symbol.references
        return string.format(" 󰌹 %s %s", num, usage)
      else
        return ""
      end
    end,
  },
}
