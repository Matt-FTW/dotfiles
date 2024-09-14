return {
  "nvim-telescope/telescope-frecency.nvim",
  opts = {},
  config = function()
    LazyVim.on_load("telescope.nvim", function()
      require("telescope").load_extension("frecency")
    end)
  end,
  keys = {
    { "<leader>fq", "<cmd>Telescope frecency<CR>", desc = "Frecency (Root Dir)" },
    { "<leader>fQ", "<cmd>Telescope frecency workspace=CWD<CR>", desc = "Frecency (cwd)" },
  },
}
