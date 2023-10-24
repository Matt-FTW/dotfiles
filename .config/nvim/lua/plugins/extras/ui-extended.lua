return {
  {
    "HampusHauffman/block.nvim",
    keys = { { "<leader>uB", "<cmd>Block<CR>", desc = "Toggle Block" } },
    opts = {
      percent = 0.9,
      depth = 4,
      colors = nil,
      automatic = false,
    },
  },
  {
    "tzachar/highlight-undo.nvim",
    event = "BufReadPost",
    opts = {
      duration = 700,
    },
  },
  {
    "mvllow/modes.nvim",
    tag = "v0.2.0",
    enabled = false,
    event = "BufReadPost",
    opts = {},
  },
  {
    "nacro90/numb.nvim",
    event = "CmdlineEnter",
    opts = {},
  },
  {
    "sitiom/nvim-numbertoggle",
    event = "BufReadPost",
  },
  {
    "anuvyklack/windows.nvim",
    event = "WinNew",
    dependencies = {
      { "anuvyklack/middleclass" },
      { "anuvyklack/animation.nvim" },
    },
    keys = {
      { "<leader>wv", "<cmd>WindowsMaximizeVertically<cr>", desc = "Vertical Zoom" },
      { "<leader>wh", "<cmd>WindowsMaximizeHorizontally<cr>", desc = "Horizontal Zoom" },
      { "<leader>we", "<cmd>WindowsEqualize<cr>", desc = "Equalize Zoom" },
    },
    opts = {},
  },
}
