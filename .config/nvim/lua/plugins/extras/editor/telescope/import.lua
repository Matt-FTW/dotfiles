return {
  "piersolenski/telescope-import.nvim",
  opts = {},
  config = function()
    require("lazyvim.util").on_load("telescope.nvim", function()
      require("telescope").setup({
        extensions = {
          import = {
            insert_at_top = true,
          },
        },
      })
      require("telescope").load_extension("import")
    end)
  end,
  keys = {
    { "<leader>sI", "<cmd>Telescope import<CR>", desc = "Imports" },
  },
}
