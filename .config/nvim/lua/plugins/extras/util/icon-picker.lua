return {
  {
    "ziontee113/icon-picker.nvim",
    dependencies = {
      "stevearc/dressing.nvim",
    },
    opts = {
      disable_legacy_commands = true,
    },
  -- stylua: ignore
    keys = {
      { "<leader>sia", "<cmd>IconPickerNormal<cr>", desc = "All" },
      { "<leader>sis", "<cmd>IconPickerNormal symbols<cr>", desc = "Symbols" },
      { "<leader>sie", "<cmd>IconPickerNormal emoji<cr>", desc = "Emoji" },
      { "<leader>sin", "<cmd>IconPickerNormal nerd_font_v3<cr>", desc = "Nerd Fonts" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>si"] = { name = "icons" },
      },
    },
  },
}
