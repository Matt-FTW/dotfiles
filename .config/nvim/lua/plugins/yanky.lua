return {
  "gbprod/yanky.nvim",
  keys = {
    {
      "<leader>sy",
      function()
        require("telescope").extensions.yank_history.yank_history({})
      end,
      desc = "Yank History",
    },
  },
}
