return {
  "ckolkey/ts-node-action",
  dependencies = { "nvim-treesitter" },
  opts = {},
  --stylua: ignore
  keys = { { "J", "<cmd>NodeAction<cr>", mode = "n", desc = "Node action" } },
}
