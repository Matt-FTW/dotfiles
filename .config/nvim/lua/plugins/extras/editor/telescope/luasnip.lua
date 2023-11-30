return {
  "benfowler/telescope-luasnip.nvim",
  config = function()
    require("lazyvim.util").on_load("telescope.nvim", function()
      require("telescope").load_extension("luasnip")
    end)
  end,
  keys = {
    { "<leader>sl", "<cmd>Telescope luasnip<CR>", desc = "Luasnip (Snippets)" },
  },
}
