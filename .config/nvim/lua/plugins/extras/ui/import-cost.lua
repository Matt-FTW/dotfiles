return {
  "barrett-ruth/import-cost.nvim",
  build = "sh install.sh yarn",
  event = "BufReadPost",
  config = true,
}
