return {
  "tsakirist/telescope-lazy.nvim",
  config = function()
    require("lazyvim.util").on_load("telescope.nvim", function()
      require("telescope").load_extension("lazy")
    end)
  end,
  keys = {
    { "<leader>sp", "<cmd>Telescope lazy<CR>", desc = "Plugins (Lazy)" },
  },
}
