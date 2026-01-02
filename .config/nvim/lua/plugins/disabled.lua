local disabled = {
  { "akinsho/bufferline.nvim" },
  { "nvim-neo-tree/neo-tree.nvim" },
  { "folke/flash.nvim" },
  { "folke/todo-comments.nvim" },
  { "folke/noice.nvim" },
  { "folke/trouble.nvim" },
  { "folke/tokyonight.nvim" },
  { "MunifTanjim/nui.nvim" },
  { "linux-cultist/venv-selector.nvim" },
}

for i, plugin in ipairs(disabled) do
  plugin.enabled = false
end

return disabled
