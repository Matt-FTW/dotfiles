local lsp = function()
  local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
  if #buf_clients == 0 then
    return "LSP Inactive"
  end

  local buf_client_names = {}

  -- add client
  for _, client in pairs(buf_clients) do
    if client.name ~= "null-ls" and client.name ~= "copilot" then
      table.insert(buf_client_names, client.name)
    end
  end

  local unique_client_names = table.concat(buf_client_names, ", ")
  local language_servers = string.format(" %s", unique_client_names)

  return language_servers
end

return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.options.component_separators = { left = "", right = "" }
    opts.options.section_separators = { left = "", right = "" }

    table.remove(opts.sections.lualine_x, 1)
    table.insert(opts.sections.lualine_x, 2, lsp)
    opts.sections.lualine_a = { { "mode", icon = "" } }
    opts.sections.lualine_y = { { "progress", icon = "", separator = " ", padding = { left = 1, right = 1 } } }
    opts.sections.lualine_z = { { "location", icon = "", padding = { left = 1, right = 1 } } }
    opts.extensions = {
      "lazy",
      "man",
      "mason",
      "nvim-dap-ui",
      "overseer",
      "quickfix",
      "toggleterm",
      "trouble",
      "neo-tree",
      "symbols-outline",
    }
  end,
}
