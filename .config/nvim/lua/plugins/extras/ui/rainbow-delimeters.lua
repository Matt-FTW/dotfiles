return {
  "HiPhish/rainbow-delimiters.nvim",
  event = "LazyFile",
  opts = {
    highlight = {
      "RainbowDelimiterBlue",
      "RainbowDelimiterYellow",
      "RainbowDelimiterViolet",
      "RainbowDelimiterOrange",
      "RainbowDelimiterCyan",
      "RainbowDelimiterRed",
      "RainbowDelimiterGreen",
    },
  },
  config = function(_, opts)
    require("rainbow-delimiters.setup").setup({ opts })
  end,
}
