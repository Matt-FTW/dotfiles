return {
  "mistricky/codesnap.nvim",
  build = "make",
  cmd = { "CodeSnap", "CodeSnapSave" },
  cond = vim.env.KITTY_SCROLLBACK_NVIM == nil,
  opts = {
    save_path = os.getenv("XDG_SCREENSHOTS_HOME") .. "/Codigo",
    title = "CodeSnap.nvim",
    code_font_family = "JetBrainsMono Nerd Font",
    watermark_font_family = "JetBrainsMono Nerd Font",
    watermark = "",
    bg_theme = "summer",
  },
}
