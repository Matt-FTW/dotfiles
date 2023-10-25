return {
  "kosayoda/nvim-lightbulb",
  event = "BufReadPre",
  opts = {
    sign = {
      enabled = false,
      priority = 10,
    },
    float = {
      enabled = true,
      text = "💡",
      win_opts = {},
    },
    virtual_text = {
      enabled = false,
      text = "💡",
    },
  },
}
