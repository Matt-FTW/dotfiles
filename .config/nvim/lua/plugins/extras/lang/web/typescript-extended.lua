return {
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.json" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "javascript",
        "jsdoc",
      })
    end,
  },
  {
    "dmmulroy/tsc.nvim",
    opts = {
      flags = {
        watch = true,
      },
    },
    keys = {
      { "<leader>ct", ft = { "typescript", "typescriptreact" }, "<cmd>TSC<cr>", desc = "Type Check" },
    },
    ft = {
      "typescript",
      "typescriptreact",
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
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "nvim-neotest/neotest-jest",
      "adrigzr/neotest-mocha",
      "marilari88/neotest-vitest",
    },
    opts = {
      adapters = {
        ["neotest-jest"] = {
          jestCommand = "npm test --",
          jestConfigFile = "custom.jest.config.ts",
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        },
        ["neotest-mocha"] = {
          command = "npm test --",
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        },
        ["neotest-vitest"] = {},
      },
    },
  },
  {
    "luckasRanarison/nvim-devdocs",
    optional = true,
    ensure_installed = {
      "react",
      "typescript",
    },
  },
}
