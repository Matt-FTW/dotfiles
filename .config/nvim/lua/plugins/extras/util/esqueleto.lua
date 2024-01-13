return {
  "cvigilv/esqueleto.nvim",
  event = "VeryLazy",
  opts = {
    directories = {
      vim.fn.stdpath("config") .. "/templates",
    },
    patterns = {
      -- File
      "README",
      "LICENSE",
      -- Filetype
      "sh",
      "markdown",
      "python",
      "lua",
      "html",
      "vue",
    },
  },
}
