return {
  {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    lazy = true,
    cmd = "ConformInfo",
    keys = {
      {
        "<leader>cF",
        function()
          require("conform").format({ formatters = { "injected" } })
        end,
        mode = { "n", "v" },
        desc = "Format Injected Langs",
      },
      {
        "<leader>cC",
        ":ConformInfo<CR>",
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
      },
      -- LazyVim will merge the options you set here with builtin formatters.
      -- You can also define any custom formatters here.
      ---@type table<string,table>
      formatters = {
        injected = { options = { ignore_errors = true } },
        -- -- Example of using dprint only when a dprint.json file is present
        -- dprint = {
        --   condition = function(ctx)
        --     return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
        --   end,
        -- },
        taplo = {
          condition = function(ctx)
            return vim.fs.find({ "Cargo.toml" }, { path = ctx.filename, upward = true })[1]
          end,
        },
      },
    },
  },
}
