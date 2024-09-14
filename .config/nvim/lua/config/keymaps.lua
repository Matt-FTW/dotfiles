local map = vim.keymap.set
local o = vim.opt

local lazy = require("lazy")

-- Search current word
local searching_brave = function()
  vim.fn.system({ "xdg-open", "https://search.brave.com/search?q=" .. vim.fn.expand("<cword>") })
end
map("n", "<leader>?", searching_brave, { noremap = true, silent = true, desc = "Search Current Word on Brave Search" })

-- Lazy options
map("n", "<leader>l", "<Nop>")
map("n", "<leader>ll", "<cmd>Lazy<cr>", { desc = "Lazy" })
-- stylua: ignore start
map("n", "<leader>ld", function() vim.fn.system({ "xdg-open", "https://lazyvim.org" }) end, { desc = "LazyVim Docs" })
map("n", "<leader>lr", function() vim.fn.system({ "xdg-open", "https://github.com/LazyVim/LazyVim" }) end, { desc = "LazyVim Repo" })
map("n", "<leader>lx", "<cmd>LazyExtras<cr>", { desc = "Extras" })
map("n", "<leader>lc", function() LazyVim.news.changelog() end, { desc = "LazyVim Changelog" })

map("n", "<leader>lu", function() lazy.update() end, { desc = "Lazy Update" })
map("n", "<leader>lC", function() lazy.check() end, { desc = "Lazy Check" })
map("n", "<leader>ls", function() lazy.sync() end, { desc = "Lazy Sync" })
-- stylua: ignore end

-- Disable LazyVim bindings
map("n", "<leader>L", "<Nop>")
map("n", "<leader>fT", "<Nop>")

-- Identation
map("n", "<", "<<", { desc = "Deindent" })
map("n", ">", ">>", { desc = "Indent" })

-- Save without formatting
map("n", "<A-s>", "<cmd>noautocmd w<CR>", { desc = "Save Without Formatting" })

-- Cursor navigation on insert mode
map("i", "<M-h>", "<left>", { desc = "Move Cursor Left" })
map("i", "<M-l>", "<right>", { desc = "Move Cursor Left" })
map("i", "<M-j>", "<down>", { desc = "Move Cursor Left" })
map("i", "<M-k>", "<up>", { desc = "Move Cursor Left" })

-- End of the word backwards
map("n", "E", "ge")

-- Increment/decrement
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- Tabs
map("n", "]<tab>", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "[<tab>", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", "<tab>", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<s-tab>", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
for i = 1, 9 do
  map("n", "<leader><tab>" .. i, "<cmd>tabn " .. i .. "<cr>", { desc = "Tab " .. i })
end
map("n", "<leader>f<tab>", function()
  vim.ui.select(vim.api.nvim_list_tabpages(), {
    prompt = "Select Tab:",
    format_item = function(tabid)
      local wins = vim.api.nvim_tabpage_list_wins(tabid)
      local not_floating_win = function(winid)
        return vim.api.nvim_win_get_config(winid).relative == ""
      end
      wins = vim.tbl_filter(not_floating_win, wins)
      local bufs = {}
      for _, win in ipairs(wins) do
        local buf = vim.api.nvim_win_get_buf(win)
        local buftype = vim.api.nvim_get_option_value("buftype", { buf = buf })
        if buftype ~= "nofile" then
          local fname = vim.api.nvim_buf_get_name(buf)
          table.insert(bufs, vim.fn.fnamemodify(fname, ":t"))
        end
      end
      local tabnr = vim.api.nvim_tabpage_get_number(tabid)
      local cwd = string.format(" %8s: ", vim.fn.fnamemodify(vim.fn.getcwd(-1, tabnr), ":t"))
      local is_current = vim.api.nvim_tabpage_get_number(0) == tabnr and "✸" or " "
      return tabnr .. is_current .. cwd .. table.concat(bufs, ", ")
    end,
  }, function(tabid)
    if tabid ~= nil then
      vim.cmd(tabid .. "tabnext")
    end
  end)
end, { desc = "Tabs" })

-- Buffers
map("n", "<leader>bf", "<cmd>bfirst<cr>", { desc = "First Buffer" })
map("n", "<leader>ba", "<cmd>blast<cr>", { desc = "Last Buffer" })
map("n", "<leader>b<tab>", "<cmd>tabnew %<cr>", { desc = "Current Buffer in New Tab" })

-- Toggle statusline
map("n", "<leader>uS", function()
  if o.laststatus:get() == 0 then
    o.laststatus = 3
  else
    o.laststatus = 0
  end
end, { desc = "Toggle Statusline" })

-- Toggle tabline
map("n", "<leader>u<tab>", function()
  if o.showtabline:get() == 0 then
    o.showtabline = 2
  else
    o.showtabline = 0
  end
end, { desc = "Toggle Tabline" })

-- Comment box
map("n", "]/", "/\\S\\zs\\s*╭<CR>zt", { desc = "Next Block Comment" })
map("n", "[/", "?\\S\\zs\\s*╭<CR>zt", { desc = "Prev Block Comment" })

-- Plugin Info
map("n", "<leader>cif", "<cmd>LazyFormatInfo<cr>", { desc = "Formatting" })
map("n", "<leader>cic", "<cmd>ConformInfo<cr>", { desc = "Conform" })
local linters = function()
  local linters_attached = require("lint").linters_by_ft[vim.bo.filetype]
  local buf_linters = {}

  if not linters_attached then
    LazyVim.warn("No linters attached", { title = "Linter" })
    return
  end

  for _, linter in pairs(linters_attached) do
    table.insert(buf_linters, linter)
  end

  local unique_client_names = table.concat(buf_linters, ", ")
  local linters = string.format("%s", unique_client_names)

  LazyVim.notify(linters, { title = "Linter" })
end
map("n", "<leader>ciL", linters, { desc = "Lint" })
map("n", "<leader>cir", "<cmd>LazyRoot<cr>", { desc = "Root" })

-- U for redo
map("n", "U", "<C-r>", { desc = "Redo" })

-- Copy whole text to clipboard
map("n", "<C-c>", ":%y+<CR>", { desc = "Copy Whole Text to Clipboard", silent = true })

-- Motion
map("c", "<C-a>", "<C-b>", { desc = "Start Of Line" })
map("i", "<C-a>", "<Home>", { desc = "Start Of Line" })
map("i", "<C-e>", "<End>", { desc = "End Of Line" })

-- Select all text
map("n", "<C-e>", "gg<S-V>G", { desc = "Select all Text", silent = true, noremap = true })

-- Paste options
map("i", "<C-v>", '<C-r>"', { desc = "Paste on Insert Mode" })
map("v", "p", '"_dP', { desc = "Paste Without Overwriting" })

-- Delete and change without yanking
map({ "n", "x" }, "<A-d>", '"_d', { desc = "Delete Without Yanking" })
map({ "n", "x" }, "<A-c>", '"_c', { desc = "Change Without Yanking" })

-- Deleting without yanking empty line
map("n", "dd", function()
  local is_empty_line = vim.api.nvim_get_current_line():match("^%s*$")
  if is_empty_line then
    return '"_dd'
  else
    return "dd"
  end
end, { noremap = true, expr = true, desc = "Don't Yank Empty Line to Clipboard" })

-- Search inside visually highlighted text
map("x", "g/", "<esc>/\\%V", { silent = false, desc = "Search Inside Visual Selection" })

-- Search visually selected text (slightly better than builtins in Neovim>=0.8)
map("x", "*", [[y/\V<C-R>=escape(@", '/\')<CR><CR>]], { desc = "Search Selected Text", silent = true })
map("x", "#", [[y?\V<C-R>=escape(@", '?\')<CR><CR>]], { desc = "Search Selected Text (Backwards)", silent = true })

-- Dashboard
map("n", "<leader>fd", function()
  if LazyVim.has("alpha-nvim") then
    require("alpha").start(true)
  elseif LazyVim.has("dashboard-nvim") then
    vim.cmd("Dashboard")
  end
end, { desc = "Dashboard" })

-- Spelling
map("n", "<leader>!", "zg", { desc = "Add Word to Dictionary" })
map("n", "<leader>@", "zug", { desc = "Remove Word from Dictionary" })

-- Terminal Stuff
if not LazyVim.has("floaterm.nvim") or not LazyVim.has("toggleterm.nvim") then
  local lazyterm = function()
    LazyVim.terminal(nil, { size = { width = 0.8, height = 0.8 }, cwd = LazyVim.root() })
  end
  map("n", "<leader>ft", lazyterm, { desc = "Terminal (Root Dir)" })
  map("n", "<leader>fT", function()
    LazyVim.terminal(nil, { size = { width = 0.8, height = 0.8 }, cwd = vim.fn.getcwd() })
  end, { desc = "Terminal (cwd)" })
  map("n", [[<c-\>]], lazyterm, { desc = "Terminal (Root Dir)" })
  map("t", [[<c-\>]], "<cmd>close<cr>", { desc = "Hide Terminal" })
end

-- Marks
map("n", "dm", function()
  local cur_line = vim.fn.line(".")
  -- Delete buffer local mark
  for _, mark in ipairs(vim.fn.getmarklist("%")) do
    if mark.pos[2] == cur_line and mark.mark:match("[a-zA-Z]") then
      vim.api.nvim_buf_del_mark(0, string.sub(mark.mark, 2, #mark.mark))
      return
    end
  end
  -- Delete global marks
  local cur_buf = vim.api.nvim_win_get_buf(vim.api.nvim_get_current_win())
  for _, mark in ipairs(vim.fn.getmarklist()) do
    if mark.pos[1] == cur_buf and mark.pos[2] == cur_line and mark.mark:match("[a-zA-Z]") then
      vim.api.nvim_buf_del_mark(0, string.sub(mark.mark, 2, #mark.mark))
      return
    end
  end
end, { noremap = true, desc = "Mark on Current Line" })

-- Empty Line
map("n", "gO", "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>", { desc = "Empty Line Above" })
map("n", "go", "<Cmd>call append(line('.'), repeat([''], v:count1))<CR>", { desc = "Empty Line Below" })

-- Insert Mode
map({ "c", "i", "t" }, "<M-BS>", "<C-w>", { desc = "Delete Word" })

-- Git
map("n", "<leader>ghb", LazyVim.lazygit.blame_line, { desc = "Blame Line" })

-- Windows Split
map("n", "<leader>_", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>\\", "<C-W>v", { desc = "Split Window Right", remap = true })
