local prefix = "<leader>b"

local keys = {}

-- stylua: ignore start
table.insert(keys, { prefix .. "S", "<Cmd>BufferLineSortByDirectory<CR>", desc = "Sort By Directory" })
table.insert(keys, { prefix .. "s", "<Cmd>BufferLineSortByExtension<CR>", desc = "Sort By Extensions" })

table.insert(keys, { prefix .. "<", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" })
table.insert(keys, { prefix .. ">", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" })
-- stylua: ignore end

return {
  "akinsho/bufferline.nvim",
  enabled = false,
  keys = keys,
  opts = {
    options = {
      modified_icon = "",
      color_icons = true,
      separator_style = "slope",
    },
  },
}
