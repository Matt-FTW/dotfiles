return {
  "ziontee113/icon-picker.nvim",
  dependencies = { "stevearc/dressing.nvim" },
  opts = {
    disable_legacy_commands = true,
  },
  -- stylua: ignore
  keys = {
    { "<leader>sI", "<cmd>IconPickerNormal<cr>", desc = "Icons" },
  },
}
