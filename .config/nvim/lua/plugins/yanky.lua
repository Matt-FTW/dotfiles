return {
  "gbprod/yanky.nvim",
  keys = {
    {
      "<leader>sy",
      function()
        require("telescope").extensions.yank_history.yank_history({})
      end,
      mode = { "n", "v" },
      desc = "Yank History",
    },
  },
}
