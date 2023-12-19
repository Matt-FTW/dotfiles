return {
  "cvigilv/esqueleto.nvim",
  event = "VeryLazy",
  opts = {
    directories = { vim.fn.stdpath("config") .. "/templates" },
    patterns = {
      "LICENSE",
      "README",
    },
  },
}
