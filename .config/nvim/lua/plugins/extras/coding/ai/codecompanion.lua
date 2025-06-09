local prefix = "<leader>a"
local user = vim.env.USER or "User"

vim.api.nvim_create_autocmd("User", {
  pattern = "CodeCompanionChatAdapter",
  callback = function(args)
    if args.data.adapter == nil or vim.tbl_isempty(args.data) then
      return
    end
    vim.g.llm_name = args.data.adapter.name
  end,
})

return {
  {
    "olimorris/codecompanion.nvim",
    cmd = { "CodeCompanion", "CodeCompanionActions", "CodeCompanionToggle", "CodeCompanionAdd", "CodeCompanionChat" },
    opts = {
      adapters = {
        deepseek_coder = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "deepseek_coder",
            schema = {
              model = {
                default = "deepseek-coder-v2:latest",
              },
            },
          })
        end,
        deepseek_r1 = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "deepseek_r1",
            schema = {
              model = {
                default = "deepseek-r1:14b",
              },
            },
          })
        end,
        ollama31 = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "ollama3.1",
            schema = {
              model = {
                default = "ollama3.1:latest",
              },
            },
          })
        end,
        qwen3 = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "qwen3",
            schema = {
              model = {
                default = "qwen3:14b",
              },
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = "qwen3",
          roles = {
            llm = "  CodeCompanion",
            user = " " .. user:sub(1, 1):upper() .. user:sub(2),
          },
          keymaps = {
            close = { modes = { n = "q", i = "<C-c>" } },
            stop = { modes = { n = "<C-c>" } },
          },
        },
        inline = { adapter = "ollama31" },
        agent = { adapter = "deepseek_r1" },
      },
      display = {
        chat = {
          show_settings = true,
          render_headers = false,
        },
      },
    },
    keys = {
      { prefix .. "a", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "Action Palette" },
      { prefix .. "c", "<cmd>CodeCompanionChat<cr>", mode = { "n", "v" }, desc = "New Chat" },
      { prefix .. "A", "<cmd>CodeCompanionAdd<cr>", mode = "v", desc = "Add Code" },
      { prefix .. "i", "<cmd>CodeCompanion<cr>", mode = "n", desc = "Inline Prompt" },
      { prefix .. "C", "<cmd>CodeCompanionToggle<cr>", mode = "n", desc = "Toggle Chat" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { prefix, group = "ai", icon = "󱚦 ", mode = { "n", "v" } },
      },
    },
  },
  {
    "folke/edgy.nvim",
    optional = true,
    opts = function(_, opts)
      opts.right = opts.right or {}
      table.insert(opts.right, {
        ft = "codecompanion",
        title = "CodeCompanion",
        size = { width = 70 },
      })
    end,
  },
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        per_filetype = {
          codecompanion = { "codecompanion" },
        },
      },
    },
  },
}
