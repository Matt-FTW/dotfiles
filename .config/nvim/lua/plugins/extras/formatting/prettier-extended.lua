local prettier = { "prettierd", "prettier", stop_after_first = true }

return {
  { import = "lazyvim.plugins.extras.formatting.prettier" },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "prettierd",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["javascript"] = prettier,
        ["javascriptreact"] = prettier,
        ["typescript"] = prettier,
        ["typescriptreact"] = prettier,
        ["vue"] = prettier,
        ["css"] = prettier,
        ["scss"] = prettier,
        ["less"] = prettier,
        ["html"] = prettier,
        ["json"] = prettier,
        ["jsonc"] = prettier,
        ["yaml"] = prettier,
        ["markdown"] = prettier,
        ["markdown.mdx"] = prettier,
        ["graphql"] = prettier,
        ["handlebars"] = prettier,
      },
    },
  },
  {
    "luckasRanarison/nvim-devdocs",
    optional = true,
    opts = {
      ensure_installed = {
        "prettier",
      },
    },
  },
}
