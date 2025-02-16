local prefix = "<leader>p"

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
      { prefix .. "wv", function() require('package-info').show({ force = true }) end, desc = "Show Package Versions" },
      { prefix .. "wu", function() require('package-info').update() end, desc = "Update Package" },
      { prefix .. "wr", function() require('package-info').delete() end, desc = "Remove Package" },
      { prefix .. "wc", function() require('package-info').change_version() end, desc = "Change Package Version" },
      { prefix .. "wi", function() require('package-info').install() end, desc = "Install New Dependency" },
    },
  },
  {
    "voldikss/vim-floaterm",
    optional = true,
    -- stylua: ignore
    keys = {
      { prefix .. "wp", "<cmd>FloatermNew --disposable --name=lazynpm --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<root> lazynpm<CR>", desc = "Lazynpm" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { prefix, group = "packages/dependencies", icon = " ", mode = { "n", "v" } },
        { prefix .. "w", group = "web", icon = "󰖟 ", mode = { "n", "v" } },
      },
    },
  },
}
