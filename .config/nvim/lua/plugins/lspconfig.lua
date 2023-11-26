local function toggle_diag_virtext()
  local virtual_text = { -- Default virtual_text opts from Lazy.Nvim
    spacing = 4,
    source = "if_many",
    prefix = "●",
  }
  local config = vim.diagnostic.config()
  if type(config.virtual_text) == "table" then
    config.virtual_text = false
    vim.diagnostic.config(config)
    vim.notify("Disable diagnostics virtualtext", 5, { title = "Diagnostics" })
  else
    config.virtual_text = virtual_text
    vim.diagnostic.config(config)
    vim.notify("Enabled diagnostics virtualtext", 5, { title = "Diagnostics" })
  end
end

return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()

      keys[#keys + 1] = { "<leader>cl", false }
      keys[#keys + 1] = { "<leader>cil", "<cmd>LspInfo<cr>", desc = "Lsp" }
      keys[#keys + 1] = { "<leader>uv", toggle_diag_virtext, desc = "Toggle Diagnostic VirtualText" }

      keys[#keys + 1] = {
        "<leader>cll",
        "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
        desc = "List Folders",
      }

      keys[#keys + 1] = { "<leader>clh", vim.lsp.codelens.run, desc = "Run Code Lens" }
      keys[#keys + 1] = { "<leader>cld", vim.lsp.codelens.refresh, desc = "Refresh Code Lens" }
      keys[#keys + 1] = { "<leader>clr", "<cmd>LspRestart<cr>", desc = "Restart Lsp" }
      keys[#keys + 1] = { "<leader>cls", "<cmd>LspStart<cr>", desc = "Start Lsp" }
      keys[#keys + 1] = { "<leader>clS", "<cmd>LspStop<cr>", desc = "Stop Lsp" }
      -- require("lazyvim.util").lsp.on_attach(function(client, buffer)
      --   if client.supports_method("textDocument/documentSymbol") then
      --     -- Enable inlay hints if the client supports it.
      --     if client.server_capabilities.inlayHintProvider then
      --       local inlay_hints_group = vim.api.nvim_create_augroup("InlayHints", { clear = true })
      --
      --       -- Initial inlay hint display.
      --       local mode = vim.api.nvim_get_mode().mode
      --       vim.lsp.inlay_hint(buffer, mode == "n" or mode == "v")
      --
      --       vim.api.nvim_create_autocmd("InsertEnter", {
      --         group = inlay_hints_group,
      --         buffer = buffer,
      --         callback = function()
      --           vim.lsp.inlay_hint(buffer, false)
      --         end,
      --       })
      --       vim.api.nvim_create_autocmd("InsertLeave", {
      --         group = inlay_hints_group,
      --         buffer = buffer,
      --         callback = function()
      --           vim.lsp.inlay_hint(buffer, true)
      --         end,
      --       })
      --     end
      --   end
      -- end)
    end,
    opts = {
      -- options for vim.diagnostic.config()
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
        enabled = true,
      },
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              hint = {
                enable = true,
              },
            },
          },
        },
        tsserver = {
          init_options = {
            preferences = {
              disableSuggestions = true,
            },
          },
          settings = {
            typescript = {
              format = {
                indentSize = vim.o.shiftwidth,
                convertTabsToSpaces = vim.o.expandtab,
                tabSize = vim.o.tabstop,
              },
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = false,
                includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              format = {
                indentSize = vim.o.shiftwidth,
                convertTabsToSpaces = vim.o.expandtab,
                tabSize = vim.o.tabstop,
              },
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = false,
                includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            completions = {
              completeFunctionCalls = true,
            },
          },
        },
      },
    },
  },
  {
    "simrat39/rust-tools.nvim",
    optional = true,
    opts = function(_, opts)
      opts.tools = {
        inlay_hints = {
          auto = function()
            if vim.fn.has("nvim-0.10") == 1 then
              return false
            else
              return true
            end
          end,
        },
      }
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      defaults = {
        ["<leader>cL"] = { name = "+lsp" },
      },
    },
  },
}
