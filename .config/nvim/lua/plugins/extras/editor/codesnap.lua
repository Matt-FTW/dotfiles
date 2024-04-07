return {
  "mistricky/codesnap.nvim",
  build = "make",
  cmd = { "CodeSnap", "CodeSnapSave" },
  cond = vim.g.vscode == nil,
  opts = {
    save_path = os.getenv("XDG_SCREENSHOTS_HOME") .. "/Codigo",
    title = "CodeSnap.nvim",
    code_font_family = "JetBrainsMono Nerd Font",
    watermark_font_family = "JetBrainsMono Nerd Font",
    watermark = "",
    bg_theme = "summer",
  },
}
