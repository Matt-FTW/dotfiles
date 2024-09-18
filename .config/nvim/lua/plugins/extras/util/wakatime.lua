return {
  "wakatime/vim-wakatime",
  event = "VeryLazy",
  setup = function()
    vim.cmd([[packadd wakatime/vim-wakatime]])
  end,
}
