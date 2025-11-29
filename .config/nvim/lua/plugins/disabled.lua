local disabled = {
  { "akinsho/bufferline.nvim" },
  { "nvim-neo-tree/neo-tree.nvim" },
  { "folke/flash.nvim" },
  { "folke/todo-comments.nvim" },
}

for i, plugin in ipairs(disabled) do
  plugin.enabled = false
end

return disabled
