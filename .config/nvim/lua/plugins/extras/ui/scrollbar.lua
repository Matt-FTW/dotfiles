local excluded_filetypes = { "neo-tree", "alpha", "Outline", "edgy", "floaterm" }

if vim.fn.has("nvim-0.10") == 1 then
  return {
    "lewis6991/satellite.nvim",
    opts = {
      excluded_filetypes = excluded_filetypes,
    },
    event = "BufRead",
  }
else
  return {
    "dstein64/nvim-scrollview",
    event = "BufReadPost",
    keys = { { "<leader>uS", "<cmd>ScrollViewToggle<CR>", desc = "Toggle Scrollview" } },
    config = function()
      require("scrollview").setup({
        excluded_filetypes = excluded_filetypes,
        signs_column = 0,
        winblend = 25,
        diagnostics_error_symbol = "",
        diagnostics_warn_symbol = "",
        diagnostics_info_symbol = "",
        diagnostics_hint_symbol = "",
      })
    end,
  }
end
