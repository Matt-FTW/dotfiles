return {
  {
    "vuki656/package-info.nvim",
    event = {
      "BufRead package.json",
      "BufRead package-lock.json",
    },
    opts = {},
    -- stylua: ignore
    keys = {
      { "<leader>pwv", function() require('package-info').show({ force = true }) end, desc = "Show Package Versions" },
      { "<leader>pwu", function() require('package-info').update() end, desc = "Update Package" },
      { "<leader>pwr", function() require('package-info').delete() end, desc = "Remove Package" },
      { "<leader>pwc", function() require('package-info').change_version() end, desc = "Change Package Version" },
      { "<leader>pwi", function() require('package-info').install() end, desc = "Install New Dependency" },
    },
  },
  {
    "voldikss/vim-floaterm",
    optional = true,
    -- stylua: ignore
    keys = {
      { "<leader>pwp", "<cmd>FloatermNew --disposable --name=lazynpm --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<root> lazynpm<CR>", desc = "Lazynpm" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>p"] = { name = " packages/dependencies" },
        ["<leader>pw"] = { name = "web" },
      },
    },
  },
}
