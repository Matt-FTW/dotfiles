return {
  {
    "mvllow/modes.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      triggers_blacklist = {
        n = { "d", "y" },
      },
    },
  },
}
