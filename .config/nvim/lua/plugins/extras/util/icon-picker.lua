return {
  "ziontee113/icon-picker.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    disable_legacy_commands = true,
  },
  -- stylua: ignore
  keys = {
    { "<leader>sI", "<cmd>IconPickerNormal<cr>", desc = "Icons" },
  },
}
