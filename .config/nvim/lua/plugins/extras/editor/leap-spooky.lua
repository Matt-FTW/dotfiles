return {
  { import = "lazyvim.plugins.extras.editor.leap" },
  {
    "ggandor/leap.nvim",
    vscode = true,
    dependencies = {
      "ggandor/leap-spooky",
      vscode = true,
    },
    opts = {
      prefix = true,
      paste_on_remote_yank = true,
    },
  },
}
