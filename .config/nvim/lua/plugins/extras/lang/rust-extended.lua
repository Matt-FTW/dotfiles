local package_prefix = "<leader>pr"

return {
  { import = "lazyvim.plugins.extras.lang.rust" },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft.toml = opts.formatters_by_ft.toml or {}
      table.insert(opts.formatters_by_ft.toml, "taplo")

      opts.formatters_by_ft.rust = opts.formatters_by_ft.rust or {}
      table.insert(opts.formatters_by_ft.rust, "rustfmt")
      return opts
    end,
  },
  {
    "Saecki/crates.nvim",
    -- stylua: ignore
    keys = {
       { package_prefix .. "R", function() require("crates").reload() end, desc = "Reload" },

       { package_prefix .. "u", function() require("crates").update_crate() end, desc = "Update Crate" },
       { package_prefix .. "u", mode = "v", function() require("crates").update_crates() end, desc = "Update Crates" },
       { package_prefix .. "a", function() require("crates").update_all_crates() end, desc = "Update All Crates" },

       { package_prefix .. "U", function() require("crates").upgrade_crate() end, desc = "Upgrade Crate" },
       { package_prefix .. "U", mode = "v", function() require("crates").upgrade_crates() end, desc = "Upgrade Crates" },
       { package_prefix .. "A", function() require("crates").upgrade_all_crates() end, desc = "Upgrade All Crates" },

       { package_prefix .. "t", function() require("crates").expand_plain_crate_to_inline_table() end, desc = "Extract into Inline Table" },
       { package_prefix .. "T", function() require("crates").extract_crate_into_table() end, desc = "Extract into Table" },

       { package_prefix .. "h", function() require("crates").open_homepage() end, desc = "Homepage" },
       { package_prefix .. "r", function() require("crates").open_repository() end, desc = "Repo" },
       { package_prefix .. "d", function() require("crates").open_documentation() end, desc = "Documentation" },
       { package_prefix .. "c", function() require("crates").open_crates_io() end, desc = "Crates.io" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>p", group = "packages/dependencies", icon = " " },
        { package_prefix, group = "rust", icon = " " },
      },
    },
  },
  {
    "luckasRanarison/nvim-devdocs",
    optional = true,
    opts = {
      ensure_installed = {
        "rust",
      },
    },
  },
}
