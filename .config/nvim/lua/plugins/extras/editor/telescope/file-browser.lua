return {
  "nvim-telescope/telescope-file-browser.nvim",
  config = function()
    require("lazyvim.util").on_load("telescope.nvim", function()
      require("telescope").setup({
        extensions = {
          file_browser = {
            hijack_netrw = true,
          },
        },
      })
      require("telescope").load_extension("file_browser")
    end)
  end,
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  -- stylua: ignore
  keys = {
    { "<leader>'", "<cmd>Telescope file_browser<cr>", desc = "Telescope File Browser (root dir)" },
    { '<leader>"', "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", desc = "Telescope File Browser (cwd)" },
  },
}
