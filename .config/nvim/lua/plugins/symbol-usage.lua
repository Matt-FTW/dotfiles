return {
  {
    "Wansmer/symbol-usage.nvim",
    event = "BufReadPre",
    enabled = false,
    config = function()
      require("symbol-usage").setup()
    end,
  },
}
