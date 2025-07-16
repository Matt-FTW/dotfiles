local go = vim.g
local o = vim.opt

-- Optimizations on startup
vim.loader.enable()

-- Personal Config and LazyVim global options
go.lualine_info_extras = false
go.codeium_cmp_hide = false
go.lazygit_config = false
go.lazyvim_cmp = "blink"
go.lazyvim_picker = "snacks"

-- Define leader key
go.mapleader = " "
go.maplocalleader = "\\"

-- Autoformat on save (Global)
go.autoformat = true

-- Font
go.gui_font_default_size = 10
go.gui_font_size = go.gui_font_default_size
go.gui_font_face = "Maple Mono NF"

-- Enable EditorConfig integration
go.editorconfig = true

-- Root dir detection
go.root_spec = {
  "lsp",
  { ".git", "lua", ".obsidian", "package.json", "Makefile", "go.mod", "cargo.toml", "pyproject.toml", "src" },
  "cwd",
}

-- Disable annoying cmd line stuff
o.showcmd = false
o.laststatus = 3
o.cmdheight = 0

-- Disable native bufferline
o.showtabline = 0

-- Enable spell checking
o.spell = true
o.spelllang:append("es")

-- Backspacing and indentation when wrapping
o.backspace = { "start", "eol", "indent" }
o.breakindent = true

-- Smoothscroll
if vim.fn.has("nvim-0.10") == 1 then
  o.smoothscroll = true
end

o.conceallevel = 2

-- Use the right clipboard when on WSL
local function is_wsl()
  local wsl_check = os.getenv("WSL_DISTRO_NAME") ~= nil
  return wsl_check
end

-- Install win32yank with cargo and then run:
-- sudo ln -s /mnt/c/Users/jared/.cargo/bin/win32yank.exe /usr/local/bin/win32yank
if is_wsl() then
  go.clipboard = {

    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },

    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 1,
  }
end
