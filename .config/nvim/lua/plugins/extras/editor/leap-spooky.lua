return {
  {
    import = "lazyvim.plugins.extras.editor.leap",
  },
  {
    "ggandor/leap.nvim",
    dependencies = {
      "ggandor/leap-spooky",
    },
    opts = {
      prefix = true,
      paste_on_remote_yank = true,
    },
  },
}
