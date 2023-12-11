return {
  "johmsalas/text-case.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("textcase").setup({})
    require("telescope").load_extension("textcase")
  end,
  keys = {
    { "gC", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "v" }, desc = "Text Case" },
  },
}
