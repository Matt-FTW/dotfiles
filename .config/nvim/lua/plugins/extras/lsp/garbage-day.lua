return {
  "zeioth/garbage-day.nvim",
  event = "LspAttach",
  opts = {
    notifications = true,
    grace_period = 60 * 10,
  },
}
