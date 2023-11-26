local Util = require("lazyvim.util")

return {
  "piersolenski/telescope-import.nvim",
  opts = {},
  config = function(_, opts)
    Util.on_load("telescope.nvim", function()
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
    { "<leader>si", "<cmd>Telescope import<CR>", desc = "Imports" },
  },
}
