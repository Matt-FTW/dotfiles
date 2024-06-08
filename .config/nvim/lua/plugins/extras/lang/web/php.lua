return {
  { import = "lazyvim.plugins.extras.lang.php" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "phpdoc",
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "php-cs-fixer",
        "phpcs",
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft.php = opts.linters_by_ft.php or {}
      table.insert(opts.linters_by_ft.php, "phpcs")
      return opts
    end,
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "olimorris/neotest-phpunit",
    },
    opts = {
      adapters = {
        ["neotest-phpunit"] = {},
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft.php = opts.formatters_by_ft.php or {}
      table.insert(opts.formatters_by_ft.php, "php_cs_fixer")
      return opts
    end,
  },
  {
    "luckasRanarison/nvim-devdocs",
    optional = true,
    opts = {
      ensure_installed = {
        "php",
      },
    },
  },
}
