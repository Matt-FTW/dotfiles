local prefix = "<leader>cl"

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
      },
      codelens = {
        enabled = false,
      },
      servers = {
        ["*"] = {
          keys = {
            { prefix, false },
            { prefix .. "r", "<cmd>LspRestart<cr>", desc = "Restart Lsp" },
            { prefix .. "s", "<cmd>LspStart<cr>", desc = "Start Lsp" },
            { prefix .. "S", "<cmd>LspStop<cr>", desc = "Stop Lsp" },
            { "E", vim.diagnostic.open_float, desc = "Line Diagnostics" },
            -- stylua: ignore start
            { prefix .. "W", function() vim.lsp.buf.remove_workspace_folder() end, desc = "Remove workspace" },
            { prefix .. "w", function() vim.lsp.buf.add_workspace_folder() end, desc = "Add workspace" },
            -- stylua: ignore end
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
