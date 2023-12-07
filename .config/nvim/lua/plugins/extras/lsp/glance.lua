return {
  "dnlhc/glance.nvim",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()

    keys[#keys + 1] = { "gd", false }
    keys[#keys + 1] = { "gr", false }
    keys[#keys + 1] = { "gy", false }
    keys[#keys + 1] = { "gI", false }
  end,
  cmd = { "Glance" },
  opts = {
    border = {
      enable = true,
    },
    hooks = {
      before_open = function(results, open, jump, method)
        local uri = vim.uri_from_bufnr(0)
        if #results == 1 then
          local target_uri = results[1].uri or results[1].targetUri

          if target_uri == uri then
            jump(results[1])
          else
            open(results)
          end
        else
          open(results)
        end
      end,
    },
  },
  keys = {
    { "gd", "<CMD>Glance definitions<CR>", desc = "Goto Definition" },
    { "gr", "<CMD>Glance references<CR>", desc = "References" },
    { "gy", "<CMD>Glance type_definitions<CR>", desc = "Goto t[y]pe definitions" },
    { "gI", "<CMD>Glance implementations<CR>", desc = "Goto implementations" },
  },
}
