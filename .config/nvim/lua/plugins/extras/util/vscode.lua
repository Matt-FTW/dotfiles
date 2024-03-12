if not vim.g.vscode then
  return {}
end

local config = require("lazy.core.config")
local vscode = require("vscode-neovim")

local map = vim.keymap.set

-- Add any additional plugins in vscode, you can set vscode=true on a plugin spec.
local enabled = {
  "flash.nvim",
  "lazy.nvim",
  "dial.nvim",
  "mini.align",
  "nvim-recorder",
  "comment-box.nvim",
  "text-case.nvim",
  "mini.ai",
  "mini.comment",
  "mini.pairs",
  "mini.surround",
  "nvim-treesitter",
  "wildfire.nvim",
  "nvim-treesitter-textobjects",
  "nvim-various-textobjs",
  "nvim-ts-context-commentstring",
  "vim-repeat",
  "vim-carbon-now-sh",
  "highlight-undo.nvim",
  "ts-node-action",
  "LazyVim",
}

config.options.checker.enabled = false
config.options.change_detection.enabled = false
config.options.defaults.cond = function(plugin)
  return vim.tbl_contains(enabled, plugin.name) or plugin.vscode
end

-- Options
vim.o.spell = false
vim.opt.timeoutlen = 150 -- To show whichkey without delay
vim.notify = vscode.notify
vim.g.clipboard = vim.g.vscode_clipboard

local function vscode_action(cmd, opts)
  return function()
    vscode.action(cmd, opts)
  end
end

-- Add some vscode specific keymaps
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimKeymaps",
  callback = function()
    -- view problems
    map("n", "<leader>xx", vscode_action("workbench.actions.view.problems"))
    -- open file explorer
    map("n", "<leader>e", vscode_action("workbench.view.explorer"))
    -- terminal
    map("n", [[<c-\>]], vscode_action("workbench.action.terminal.toggleTerminal"))
    map("n", "<leader>fts", vscode_action("workbench.action.terminal.newWithCwd"))
    -- working with editors (buffers)
    map("n", "<leader>bo", vscode_action("workbench.action.closeOtherEditors"))
    map("n", "<leader>bb", function()
      vscode_action("workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup")
      vscode_action("list.select")
    end)
    map("n", "<leader>bn", vscode_action("workbench.action.nextEditor"))
    map("n", "<leader>bu", vscode_action("workbench.action.reopenClosedEditor"))
    map("n", "<leader>bh", vscode_action("workbench.action.moveEditorToLeftGroup"))
    map("n", "<leader>bj", vscode_action("workbench.action.moveEditorToBelowGroup"))
    map("n", "<leader>bk", vscode_action("workbench.action.moveEditorToAboveGroup"))
    map("n", "<leader>bl", vscode_action("workbench.action.moveEditorToRightGroup"))
    map("n", "<leader>,", vscode_action("workbench.action.showAllEditors"))
    map("n", "<leader>bA", vscode_action("workbench.action.closeAllEditors"))
    map("n", "<leader>ba", vscode_action("workbench.action.lastEditorInGroup"))
    map("n", "<leader>bf", vscode_action("workbench.action.firstEditorInGroup"))
    map("n", "<Leader>bL", vscode_action("workbench.action.closeEditorsToTheLeft"))
    map("n", "<Leader>bR", vscode_action("workbench.action.closeEditorsToTheRight"))
    map("n", "H", vscode_action("workbench.action.previousEditorInGroup"))
    map("n", "L", vscode_action("workbench.action.nextEditorInGroup"))
    map("n", "<leader>bd", vscode_action("workbench.action.closeActiveEditor"))
    map("n", "<leader><tab>", vscode_action("workbench.action.showMultipleEditorTabs"))
    map("n", "<leader><s-tab>", vscode_action("workbench.action.showEditorTab"))
    -- breakpoints
    map("n", "<F2>", vscode_action("editor.debug.action.toggleBreakpoint"))
    -- windows
    map("n", "<leader>|", vscode_action("workbench.action.splitEditorRight"))
    map("n", "<leader>-", vscode_action("workbench.action.splitEditorDown"))
    -- LSP actions
    map("n", "<leader>ca", vscode_action("editor.action.codeAction"))
    map("n", "gy", vscode_action("editor.action.goToTypeDefinition"))
    map("n", "gr", vscode_action("editor.action.goToReferences"))
    map("n", "gi", vscode_action("editor.action.goToImplementation"))
    map("n", "K", vscode_action("editor.action.showHover"))
    map("n", "<leader>cr", vscode_action("editor.action.rename"))
    map("n", "<leader>co", vscode_action("editor.action.organizeImports"))
    map("n", "<leader>cf", vscode_action("editor.action.formatDocument"))
    map("n", "<leader>ss", vscode_action("workbench.action.gotoSymbol"))
    map("n", "<leader>sS", vscode_action("workbench.action.showAllSymbols"))
    -- refactor
    map("n", "<leader>cR", vscode_action("editor.action.refactor"))
    -- markdown preview
    map("n", "<leader>cp", vscode_action("markdown.showPreviewToSide"))
    -- project manager
    map("n", "<leader>fp", vscode_action("projectManager.listProjects"))
    -- zen mode
    map("n", "<leader>z", vscode_action("workbench.action.toggleZenMode"))
    -- cspell
    map("n", "<leader>!", vscode_action("cSpell.addWordToDictionary"))
    map("n", "<leader>us", vscode_action("cSpell.toggleEnableSpellChecker"))
    -- comments
    map("n", "<leader>xt", vscode_action("workspaceAnchors.focus"))
    -- git
    map("n", "<leader>gg", vscode_action("gitlens.views.home.focus"))
    map("n", "<leader>ub", vscode_action("gitlens.toggleFileBlame"))
    map("n", "]h", function()
      vscode_action("workbench.action.editor.nextChange")
      vscode_action("workbench.action.compareEditor.nextChange")
    end)
    map("n", "[h", function()
      vscode_action("workbench.action.editor.previousChange")
      vscode_action("workbench.action.compareEditor.previousChange")
    end)
    -- statusline
    map("n", "<leader>uS", vscode_action("workbench.action.toggleStatusbarVisibility"))
    -- codeium
    map("n", "<leader>cI", vscode_action("codeium.toggleEnable"))
    map({ "n", "v" }, "<leader>id", vscode_action("codeium.generateFunctionDocstring"))
    map("n", "<leader>ic", vscode_action("codeium.openChatView"))
    map("n", "<leader>is", vscode_action("codeium.openSearchView"))
    map({ "n", "v" }, "<leader>ie", vscode_action("codeium.explainCodeBlock"))
    map({ "n", "v" }, "<leader>iE", vscode_action("codeium.explainProblem"))
    map({ "n", "v" }, "<leader>ii", vscode_action("codeium.openCodeiumCommand"))
    -- diagnostics
    map("n", "]d", vscode_action("editor.action.marker.next"))
    map("n", "[d", vscode_action("editor.action.marker.prev"))
    -- zoxide
    map("n", "<leader>fz", vscode_action("autojump.openFolder"))
    -- whichkey
    map("n", "<leader>", vscode_action("whichkey.show"))
    -- search
    map("n", "<leader><space>", "<cmd>Find<cr>")
    map("n", "<leader>ff", "<cmd>Find<cr>")
    map("n", "<leader>/", vscode_action("workbench.action.findInFiles"))
    map("n", "<leader>sg", vscode_action("workbench.action.findInFiles"))
    map("n", "<leader>sc", vscode_action("workbench.action.showCommands"))
    -- ui
    map("n", "<leader>uC", vscode_action("workbench.action.selectTheme"))
  end,
})

return {
  {
    "LazyVim/LazyVim",
    config = function(_, opts)
      opts = opts or {}
      -- disable the colorscheme
      opts.colorscheme = function() end
      require("lazyvim").setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        enable = false,
      },
    },
  },
  {
    "folke/flash.nvim",
    init = function()
      local palette = require("catppuccin.palettes").get_palette("macchiato")
      local bg = palette.none
      vim.api.nvim_set_hl(0, "FlashBackdrop", { fg = bg })
      vim.api.nvim_set_hl(0, "FlashLabel", { fg = palette.green, bg = bg, bold = true })
      vim.api.nvim_set_hl(0, "FlashMatch", { fg = palette.lavender, bg = bg })
      vim.api.nvim_set_hl(0, "FlashCurrent", { fg = palette.peach, bg = bg })
    end,
  },
}
