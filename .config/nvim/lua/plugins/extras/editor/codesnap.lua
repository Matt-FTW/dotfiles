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
    save_path = "/home/matt/Images/Capturas/Codigo", -- FIX: Need to find a way for this to work inside vscode and kitty
    title = "CodeSnap.nvim",
    code_font_family = "JetBrainsMono Nerd Font",
    watermark_font_family = "JetBrainsMono Nerd Font",
    watermark = "",
    bg_theme = "summer",
  },
}
