return {
  {
    "nvim-telescope/telescope-dap.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
    enabled = false,
    config = function()
      require("telescope").load_extension("dap")
    end,
  },
}
