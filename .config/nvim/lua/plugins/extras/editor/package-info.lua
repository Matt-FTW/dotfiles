local prefix = "<leader>pw"

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
      { prefix .. "v", function() require('package-info').show({ force = true }) end, desc = "Show Package Versions" },
      { prefix .. "u", function() require('package-info').update() end, desc = "Update Package" },
      { prefix .. "r", function() require('package-info').delete() end, desc = "Remove Package" },
      { prefix .. "c", function() require('package-info').change_version() end, desc = "Change Package Version" },
      { prefix .. "i", function() require('package-info').install() end, desc = "Install New Dependency" },
    },
  },
  {
    "voldikss/vim-floaterm",
    optional = true,
    -- stylua: ignore
    keys = {
      { prefix .. "p", "<cmd>FloatermNew --disposable --name=lazynpm --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<root> lazynpm<CR>", desc = "Lazynpm" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>p", group = "packages/dependencies", icon = " " },
        { prefix, group = "web", icon = "󰖟 " },
      },
    },
  },
}
