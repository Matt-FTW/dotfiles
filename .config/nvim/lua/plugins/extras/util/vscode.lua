if not vim.g.vscode then
  return {}
end

local Config = require("lazy.core.config")
local Plugin = require("lazy.core.plugin")
local vscode = require("vscode-neovim")

local map = vim.keymap.set

-- Add any additional plugins in vscode, you can set vscode=true on a plugin spec.
local enabled = {
  "flash.nvim",
  "lazy.nvim",
  "dial.nvim",
  "mini.align",
  "comment-box.nvim",
  "text-case.nvim",
  "mini.ai",
  "mini.comment",
  "mini.pairs",
  "mini.surround",
  "nvim-treesitter",
  "nvim-treesitter-textobjects",
  "nvim-various-textobjs",
  "nvim-ts-context-commentstring",
  "vim-repeat",
  "highlight-undo.nvim",
  "ts-node-action",
  "LazyVim",
}

Config.options.checker.enabled = false
Config.options.change_detection.enabled = false
Config.options.defaults.cond = function(plugin)
  return vim.tbl_contains(enabled, plugin.name) or plugin.vscode
end

vim.o.spell = false
vim.notify = vscode.notify
vim.g.clipboard = vim.g.vscode_clipboard

local function vscode_action(cmd)
  return function()
    vscode.action(cmd)
  end
end

-- Add some vscode specific keymaps
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimKeymaps",
  callback = function()
    -- find file
    map("n", "<leader><space>", "<cmd>Find<cr>")
    -- find in files
    map("n", "<leader>/", vscode_action("workbench.action.findInFiles"))
    -- open symbol
    map("n", "<leader>ss", vscode_action("workbench.action.gotoSymbol"))
    -- view problems
    map("n", "<leader>xx", vscode_action("workbench.actions.view.problems"))
    -- open file explorer in left sidebar
    map("n", "<leader>e", vscode_action("workbench.view.explorer"))
    -- Code Action
    map("n", "<leader>ca", vscode_action("editor.action.codeAction"))
    -- Open terminal
    map("n", "<leader>ft", vscode_action("workbench.action.terminal.focus"))
    -- LSP actions
    map("n", "gy", vscode_action("editor.action.goToTypeDefinition"))
    map("n", "gr", vscode_action("editor.action.goToReferences"))
    map("n", "gi", vscode_action("editor.action.goToImplementation"))
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
}
