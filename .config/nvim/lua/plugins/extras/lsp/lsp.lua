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

      keys[#keys + 1] = { "gr", "<CMD>Glance references<CR>", desc = "References" }
      keys[#keys + 1] = { "gy", "<CMD>Glance type_definitions<CR>", desc = "Goto t[y]pe definitions" }
      keys[#keys + 1] = { "gI", "<CMD>Glance implementations<CR>", desc = "Goto implementations" }

      keys[#keys + 1] = { "<leader>ca", require("actions-preview").code_actions, desc = "Code Action Preview" }

      keys[#keys + 1] = { "<leader>cl", false }
      keys[#keys + 1] = { "<leader>cli", "<cmd>LspInfo<cr>", desc = "LspInfo" }
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
      require("which-key").register({
        ["<leader>cl"] = { name = "+lsp" },
      })
      require("lazyvim.util").lsp.on_attach(function(client, buffer)
        if client.supports_method("textDocument/documentSymbol") then
          -- Enable inlay hints if the client supports it.
          if client.server_capabilities.inlayHintProvider then
            local inlay_hints_group = vim.api.nvim_create_augroup("InlayHints", { clear = true })

            -- Initial inlay hint display.
            local mode = vim.api.nvim_get_mode().mode
            vim.lsp.inlay_hint(buffer, mode == "n" or mode == "v")

            vim.api.nvim_create_autocmd("InsertEnter", {
              group = inlay_hints_group,
              buffer = buffer,
              callback = function()
                vim.lsp.inlay_hint(buffer, false)
              end,
            })
            vim.api.nvim_create_autocmd("InsertLeave", {
              group = inlay_hints_group,
              buffer = buffer,
              callback = function()
                vim.lsp.inlay_hint(buffer, true)
              end,
            })
          end
        end
      end)
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
    "aznhe21/actions-preview.nvim",
    event = "LspAttach",
    opts = {
      telescope = {
        sorting_strategy = "ascending",
        layout_strategy = "vertical",
        layout_config = {
          width = 0.8,
          height = 0.9,
          prompt_position = "top",
          preview_cutoff = 20,
          preview_height = function(_, _, max_lines)
            return max_lines - 15
          end,
        },
      },
    },
  },
  {
    "dnlhc/glance.nvim",
    cmd = { "Glance" },
    opts = {
      border = {
        enable = true,
      },
    },
  },
  {
    "simrat39/rust-tools.nvim",
    lazy = true,
    opts = function(_, opts)
      opts.tools = {
        inlay_hints = {
          auto = false,
        },
      }
    end,
  },
  {
    "hinell/lsp-timeout.nvim",
    event = "LspAttach",
    enabled = false,
    dependencies = { "neovim/nvim-lspconfig" },
    init = function()
      vim.g["lsp-timeout-config"] = {
        startTimeout = 1000 * 1, -- ms before restart
      }
    end,
  },
  {
    "VidocqH/lsp-lens.nvim",
    event = "BufReadPost",
    opts = {
      sections = {
        definition = false,
        references = function(count)
          return " Ref: " .. count
        end,
        implements = function(count)
          return "󱁤 Imp: " .. count
        end,
        git_authors = false,
      },
    },
    keys = {
      { "<leader>ue", "<cmd>LspLensToggle<cr>", desc = "Toggle Lsp Lens" },
    },
  },
}
