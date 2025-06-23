return {
  "mistricky/codesnap.nvim",
  build = "make",
  cmd = { "CodeSnap", "CodeSnapSave" },
  vscode = false,
  keys = {
    { "<leader>cs", mode = "v", "<cmd>'<,'>CodeSnap<cr>", desc = "Screenshot (Clipboard)" },
    { "<leader>cS", mode = "v", "<cmd>'<,'>CodeSnapSave<cr>", desc = "Screenshot (Save)" },
  },
  cond = vim.env.KITTY_SCROLLBACK_NVIM == nil,
  opts = {
    save_path = (os.getenv("HOME") .. "/pictures/screenshots/code"),
    title = "CodeSnap.nvim",
    code_font_family = "Maple Mono NF",
    watermark_font_family = "Maple Mono NF",
    watermark = "",
    bg_theme = "summer",
  },
}
