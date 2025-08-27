local package_prefix = "<leader>pp"

-- LSP Server to use for Python.
-- Set to "basedpyright" to use basedpyright instead of pyright.
vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.lazyvim_python_ruff = "ruff"

return {
  { import = "lazyvim.plugins.extras.lang.python" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "requirements",
      },
    },
  },
  {
    "MeanderingProgrammer/py-requirements.nvim",
    enabled = false,
    event = {
      "BufRead requirements.txt",
    },
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    opts = {},
    -- stylua: ignore
    keys = {
      { package_prefix .. "u", function() require("py-requirements").upgrade() end, desc = "Update Package" },
      { package_prefix .. "i", function() require("py-requirements").show_description() end, desc = "Package Info" },
      { package_prefix .. "a", function() require("py-requirements").upgrade_all() end, desc = "Update All Packages" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>p", group = "packages/dependencies", icon = " " },
        { package_prefix, group = "python", icon = " " },
      },
    },
  },
  {
    "luckasRanarison/nvim-devdocs",
    optional = true,
    opts = {
      ensure_installed = {
        "python-3.11",
      },
    },
  },
}
