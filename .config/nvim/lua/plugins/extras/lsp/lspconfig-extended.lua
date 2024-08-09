local nvim_0_10 = vim.fn.has("nvim-0.10")
local prefix = "<leader>cl"

return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()

      keys[#keys + 1] = { "<leader>cl", false }
      keys[#keys + 1] = { "<leader>cil", "<cmd>LspInfo<cr>", desc = "Lsp" }
      keys[#keys + 1] = { prefix .. "r", "<cmd>LspRestart<cr>", desc = "Restart Lsp" }
      keys[#keys + 1] = { prefix .. "s", "<cmd>LspStart<cr>", desc = "Start Lsp" }
      keys[#keys + 1] = { prefix .. "S", "<cmd>LspStop<cr>", desc = "Stop Lsp" }

      -- stylua: ignore start
      keys[#keys + 1] = { prefix .. "r", function() vim.lsp.buf.remove_workspace_folder() end, desc = "Remove workspace" }
      keys[#keys + 1] = { prefix .. "a", function() vim.lsp.buf.add_workspace_folder() end, desc = "Add workspace" }
      -- stylua: ignore end
    end,
    opts = {
      diagnostics = {
        virtual_text = {
          float = {
            border = {
              { "┌", "FloatBorder" },
              { "─", "FloatBorder" },
              { "┐", "FloatBorder" },
              { "│", "FloatBorder" },
              { "┘", "FloatBorder" },
              { "─", "FloatBorder" },
              { "└", "FloatBorder" },
              { "│", "FloatBorder" },
            },
          },
        },
      },
      inlay_hints = {
        enabled = nvim_0_10,
      },
      codelens = {
        enabled = false,
      },
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              hint = {
                enable = nvim_0_10,
                setType = nvim_0_10,
              },
            },
          },
        },
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>cl", group = "lsp", icon = " " },
      },
    },
  },
}
