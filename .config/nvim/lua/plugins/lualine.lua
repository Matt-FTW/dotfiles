local lsp = function()
  local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
  if #buf_clients == 0 then
    return ""
  else
    return " "
  end
end

local formatter = function()
  local formatters = require("conform").list_formatters(0)
  if #formatters == 0 then
    return ""
  else
    return "󰛖 "
  end
end

local linter = function()
  local linters = require("lint").linters_by_ft[vim.bo.filetype]
  if #linters == 0 then
    return ""
  else
    return "󱉶 "
  end
end

return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.options.component_separators = { left = "", right = "" }
    opts.options.section_separators = { left = "", right = "" }

    table.insert(opts.sections.lualine_x, 2, lsp)
    table.insert(opts.sections.lualine_x, 2, formatter)
    table.insert(opts.sections.lualine_x, 2, linter)
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
