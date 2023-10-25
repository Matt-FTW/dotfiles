return {
  "nvim-neotest/neotest",
  dependencies = {
    "adrigzr/neotest-mocha",
  },
  opts = function(_, opts)
    table.insert(
      opts.adapters,
      require("neotest-mocha")({
        command = "npm test --",
        env = { CI = true },
        cwd = function(path)
          return vim.fn.getcwd()
        end,
      })
    )
  end,
}
