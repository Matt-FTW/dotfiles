return {
  {
    "dmmulroy/tsc.nvim",
    opts = {
      flags = {
        watch = true,
      },
    },
    cmd = "TSC",
    keys = {
      { "<leader>ct", "<cmd>TSC<cr>", desc = "Type Check" },
    },
    ft = {
      "typescript",
    },
  },
  {
    -- TODO: Need to look more into this plugin
    "pmizio/typescript-tools.nvim",
    enabled = false,
    event = {
      "BufRead *.js,*.jsx,*.mjs,*.cjs,*ts,*tsx",
      "BufNewFile *.js,*.jsx,*.mjs,*.cjs,*ts,*tsx",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false

        vim.keymap.set(
          "n",
          "gD",
          "<Cmd>TSToolsGoToSourceDefinition<CR>",
          { buffer = bufnr, desc = "Source Definition" }
        )

        vim.keymap.set(
          "n",
          "<localleader>i",
          "<Cmd>TSToolsAddMissingImports<CR>",
          { buffer = bufnr, desc = "Add missing imports" }
        )
        vim.keymap.set(
          "n",
          "<localleader>o",
          "<Cmd>TSToolsOrganizeImports<CR>",
          { buffer = bufnr, desc = "Organize imports" }
        )
        vim.keymap.set(
          "n",
          "<localleader>r",
          "<Cmd>TSToolsRemoveUnused<CR>",
          { buffer = bufnr, desc = "Remove unused variables" }
        )
        vim.keymap.set("n", "<localleader>f", "<Cmd>TSToolsFixAll<CR>", { buffer = bufnr, desc = "Fix all" })
      end,
      settings = {
        tsserver_file_preferences = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
      code_lens = "all",
    },
  },
}
