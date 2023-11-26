return {
  "cshuaimin/ssr.nvim",
  opts = {},
  -- stylua: ignore
  keys = {
    { "<leader>srs", function() require("ssr").open() end, desc = "Structural" },
  },
}
