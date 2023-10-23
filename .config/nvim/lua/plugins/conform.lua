return {
  {
    "stevearc/conform.nvim",
    keys = {
      {
        "<leader>cC",
        "<cmd>ConformInfo<CR>",
        mode = { "n", "v" },
        desc = "Conform Info",
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt", "shellharden" },
        python = { "black" },
        bash = { "shfmt", "shellharden" },
        javascript = { { "prettierd", "prettier", "rustywind" } },
        javascriptreact = { { "prettierd", "prettier", "rustywind" } },
        typescript = { { "prettierd", "prettier", "rustywind" } },
        typescriptreact = { { "prettierd", "prettier", "rustywind" } },
        vue = { { "prettierd", "prettier", "rustywind" } },
        html = { { "prettierd", "prettier", "rustywind", "stylelint" } },
        rust = { "rusfmt" },
        go = { "gofumpt", "goimports" },
        sass = { "stylelint" },
        css = { { "prettierd", "prettier", "stylelint" } },
        scss = { { "prettierd", "prettier", "stylelint" } },
        less = { { "prettierd", "prettier", "stylelint" } },
        markdown = { { "prettierd", "prettier" } },
        toml = { "taplo" },
      },
    },
  },
}
