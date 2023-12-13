return {
  "ziontee113/icon-picker.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "stevearc/dressing.nvim",
  },
  opts = {
    disable_legacy_commands = true,
  },
  -- stylua: ignore
  keys = {
    { "<leader>si", "<cmd>IconPickerNormal<cr>", desc = "Icons" },
  },
}
