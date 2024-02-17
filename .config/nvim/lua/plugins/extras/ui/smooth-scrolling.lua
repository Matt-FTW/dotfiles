local map = vim.keymap.set

return {
  "declancm/cinnamon.nvim",
  event = "VeryLazy",
  opts = {
    default_keymaps = true,
    extra_keymaps = true,
    extended_keymaps = true,
    default_delay = 2,
  },
}
