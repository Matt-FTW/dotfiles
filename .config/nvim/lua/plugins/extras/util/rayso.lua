return {
  "TobinPalmer/rayso.nvim",
  cmd = { "Rayso" },
  keys = {
    { "<leader>cS", "<cmd>Rayso<cr>", mode = { "n" }, desc = "Screenshot Code" },
    { "<leader>cS", "<cmd>'<,'>Rayso<cr>", mode = { "v" }, desc = "Screenshot Selection" },
  },
  opts = {
    open_cmd = "librewolf",
  },
}
