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
      floating_window_scaling_factor = {
        height = 1,
        width = 1,
      },
      yazi_floating_window_border = "none",
      integrations = {
        grep_in_selected_files = "snacks.picker",
        grep_in_directory = "snacks.picker",
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
}
