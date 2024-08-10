return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()

      keys[#keys + 1] = { "gd", "<cmd>Glance definitions<cr>", desc = "Goto Definitions" }
      keys[#keys + 1] = { "gr", "<cmd>Glance references<cr>", desc = "Goto References" }
      keys[#keys + 1] = { "gy", "<cmd>Glance type_definitions<cr>", desc = "Goto T[y]pe Definitions" }
      keys[#keys + 1] = { "gI", "<cmd>Glance implementations<cr>", desc = "Goto Implementations" }
    end,
  },
  {
    "dnlhc/glance.nvim",
    cmd = { "Glance" },
    event = "LspAttach",
    opts = {
      border = {
        enable = true,
      },
      use_trouble_qf = true,
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
  },
}
