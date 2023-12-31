local inlayHints = {
  includeInlayParameterNameHints = "all",
  includeInlayParameterNameHintsWhenArgumentMatchesName = true,
  includeInlayFunctionParameterTypeHints = true,
  includeInlayVariableTypeHints = true,
  includeInlayVariableTypeHintsWhenTypeMatchesName = true,
  includeInlayPropertyDeclarationTypeHints = true,
  includeInlayFunctionLikeReturnTypeHints = true,
  includeInlayEnumMemberValueHints = true,
}

local function denoConfigExists()
  local root = require("lazyvim.util.root").get() .. "/deno.json"

  if vim.fn.filereadable(root) == 1 then
    return true
  end

  return false
end

return {
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.json" },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "deno" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          init_options = {
            preferences = {
              disableSuggestions = true,
            },
          },
          settings = {
            typescript = {
              inlayHints = inlayHints,
            },
            javascript = {
              inlayHints = inlayHints,
            },
          },
        },
        denols = {
          root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc", "deno.lock"),
        },
      },
      setup = {
        tsserver = function(_, opts)
          -- Disable tsserver if denols is present
          return denoConfigExists()
        end,
      },
    },
  },
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
