local prefix = "<leader>si"

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
      { prefix .. "a", "<cmd>IconPickerNormal<cr>", desc = "All" },
      { prefix .. "s", "<cmd>IconPickerNormal symbols<cr>", desc = "Symbols" },
      { prefix .. "e", "<cmd>IconPickerNormal emoji<cr>", desc = "Emoji" },
      { prefix .. "n", "<cmd>IconPickerNormal nerd_font_v3<cr>", desc = "Nerd Fonts" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { prefix, group = "icons", icon = " " },
      },
    },
  },
}
