return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "cspell" })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        ["*"] = { "cspell" },
      },
      linters = {
        cspell = {
          condition = function(ctx)
            if vim.fs.find({ "cspell.json" }, { path = ctx.filename, upward = true })[1] then
              -- stylua: ignore
              vim.keymap.set("n", "<leader>!", function() require("util.cspell").addWordToDictionary() end, { desc = "Add Word to Dictionary", silent = true })
              return true
            else
              return false
            end
          end,
        },
      },
    },
  },
}
