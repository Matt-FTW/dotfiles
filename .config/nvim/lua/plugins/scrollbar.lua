return {
  {
    "dstein64/nvim-scrollview",
    event = "BufReadPost",
    enabled = false,
    keys = { { "<leader>uS", "<cmd>ScrollViewToggle<CR>", desc = "Toggle Scrollview" } },
    config = function()
      require("scrollview").setup({
        excluded_filetypes = { "neo-tree", "alpha", "symbols-outline" },
        signs_column = 0,
        winblend = 25,
        diagnostics_error_symbol = "",
        diagnostics_warn_symbol = "",
        diagnostics_info_symbol = "",
        diagnostics_hint_symbol = "",
      })
    end,
  },
}
