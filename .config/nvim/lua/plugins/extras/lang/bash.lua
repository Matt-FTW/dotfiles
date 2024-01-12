return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "bash" })
      end
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {},
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "bash-language-server", "shellcheck" })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft.bash = opts.linters_by_ft.bash or {}
      table.insert(opts.linters_by_ft.bash, "shellcheck")
      return opts
    end,
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "rcasia/neotest-bash",
    },
    opts = {
      adapters = {
        ["neotest-bash"] = {},
      },
    },
  },
  {
    "luckasRanarison/nvim-devdocs",
    optional = true,
    ensure_installed = {
      "bash",
    },
  },
}
