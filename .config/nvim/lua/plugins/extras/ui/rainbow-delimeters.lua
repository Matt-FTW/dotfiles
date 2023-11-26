return {
  "HiPhish/rainbow-delimiters.nvim",
  event = "BufRead",
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
