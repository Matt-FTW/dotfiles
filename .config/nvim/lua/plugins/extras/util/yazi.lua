return {
  {
    "mikavilpas/yazi.nvim",
    keys = {
      { "<leader>e", "<cmd>Yazi<cr>", desc = "Yazi (Current File)" },
      { "<leader>E", "<cmd>Yazi cwd<cr>", desc = "Yazi (cwd)" },
      { "<a-e>", "<cmd>Yazi toggle<cr>", desc = "Resume Last Yazi Session" },
    },
    opts = {
      open_for_directories = true,
      floating_window_scaling_factor = 0.8,
      yazi_floating_window_border = "none",
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
}
