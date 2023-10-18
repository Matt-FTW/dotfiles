return {
  {
    "mfussenegger/nvim-lint",
    event = "LazyFile",
    opts = {
      -- Event to trigger linters
      events = { "BufWritePost", "BufReadPost", "InsertLeave" },
      linters_by_ft = {
        fish = { "fish" },
        markdown = { "markdownlint" },
        -- python = { "pylint" },
        dockerfile = { "hadolint" },
        css = { "stylelint" },
        sass = { "stylelint" },
        scss = { "stylelint" },
      },
    },
  },
}
