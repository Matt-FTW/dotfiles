return {
  "cshuaimin/ssr.nvim",
  opts = {},
  keys = {
    {
      "<leader>srs",
      function()
        require("ssr").open()
      end,
      desc = "Structural",
    },
  },
}
