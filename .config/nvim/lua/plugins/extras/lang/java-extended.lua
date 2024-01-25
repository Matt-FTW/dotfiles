local Util = require("lazyvim.util")

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "java" })
    end,
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = function(_, opts)
          opts.registries = opts.registries or {}
          table.insert(opts.registries, 1, "github:nvim-java/mason-registry")
          opts.ensure_installed = opts.ensure_installed or {}
          vim.list_extend(opts.ensure_installed, { "java-test", "java-debug-adapter" })
        end,
      },
    },
  },
  {
    "nvim-java/nvim-java",
    lazy = true,
    ft = "java",
    dependencies = {
      { "nvim-java/lua-async-await" },
      { "nvim-java/nvim-java-core" },
      { "nvim-java/nvim-java-test" },
      { "nvim-java/nvim-java-dap" },
      {
        "neovim/nvim-lspconfig",
        opts = {
          servers = {
            jdtls = {
              keys = {
                -- Workaround for the lack of a DAP strategy in neotest-java
                {
                  "<leader>td",
                  function()
                    require("java").dap.config_dap()
                    require("java").test.debug_current_method()
                  end,
                  desc = "Debug Nearest (Java)",
                },
              },
            },
          },
        },
      },
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          handlers = {
            ["jdtls"] = function()
              require("java").setup({
                java_test = {
                  enable = Util.has("nvim-dap"),
                },
                java_debug_adapter = {
                  enable = Util.has("nvim-dap"),
                },
                jdk = {
                  auto_install = false,
                },
              })
            end,
          },
        },
      },
    },
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "rcasia/neotest-java",
    },
    opts = {
      adapters = {
        ["neotest-java"] = {},
      },
    },
  },
}
