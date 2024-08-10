return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()

      keys[#keys + 1] = {
        "<leader>ca",
        function()
          require("actions-preview").code_actions()
        end,
        mode = { "n", "v" },
        desc = "Code Action Preview",
      }
      keys[#keys + 1] = { "gr", "<cmd>Glance references<cr>", desc = "Goto References" }
      keys[#keys + 1] = { "gy", "<cmd>Glance type_definitions<cr>", desc = "Goto T[y]pe Definitions" }
      keys[#keys + 1] = { "gI", "<cmd>Glance implementations<cr>", desc = "Goto Implementations" }
    end,
  },
  {
    "aznhe21/actions-preview.nvim",
    event = "LspAttach",
    opts = {
      telescope = {
        sorting_strategy = "ascending",
        layout_strategy = "vertical",
        layout_config = {
          width = 0.6,
          height = 0.7,
          prompt_position = "top",
          preview_cutoff = 20,
          preview_height = function(_, _, max_lines)
            return max_lines - 15
          end,
        },
      },
    },
  },
}
