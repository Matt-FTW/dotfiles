return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      ["*"] = { "cspell" },
    },
    linters = {
      cspell = {
        condition = function(ctx)
          return vim.fs.find({ "cspell.json" }, { path = ctx.filename, upward = true })[1]
        end,
      },
    },
  },
}
