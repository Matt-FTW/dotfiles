return {
  "HiPhish/rainbow-delimiters.nvim",
  event = "BufRead",
  config = function(_, opts)
    require("rainbow-delimiters.setup").setup({ opts })
  end,
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
}
