return {
  "kosayoda/nvim-lightbulb",
  event = "LspAttach",
  opts = {
    autocmd = { enabled = true },
    sign = { enabled = true, text = "" },
    action_kinds = { "quickfix", "refactor" },
    ignore = {
      actions_without_kind = true,
    },
  },
}
