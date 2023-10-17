return {
  {
    "chrisgrieser/nvim-spider",
    lazy = true,
    enabled = false,
    config = function()
      require("spider").setup({})
    end,
  },
}
