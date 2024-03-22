return {
  "dharmx/telescope-media.nvim",
  config = function()
    LazyVim.on_load("telescope.nvim", function()
      require("telescope").setup({
        extensions = {
          media = {
            backend = "ueberzug", -- image/gif backend
          },
        },
      })
      require("telescope").load_extension("media")
    end)
  end,
  keys = {
    { "<leader>sM", "<cmd>Telescope media<CR>", desc = "Media" },
  },
}
