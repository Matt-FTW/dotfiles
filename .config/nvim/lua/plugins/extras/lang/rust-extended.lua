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
       { "<leader>prR", function() require("crates").reload() end, desc = "Reload" },

       { "<leader>pru", function() require("crates").update_crate() end, desc = "Update Crate" },
       { "<leader>pru", mode = "v", function() require("crates").update_crates() end, desc = "Update Crates" },
       { "<leader>pra", function() require("crates").update_all_crates() end, desc = "Update All Crates" },

       { "<leader>prU", function() require("crates").upgrade_crate() end, desc = "Upgrade Crate" },
       { "<leader>prU", mode = "v", function() require("crates").upgrade_crates() end, desc = "Upgrade Crates" },
       { "<leader>prA", function() require("crates").upgrade_all_crates() end, desc = "Upgrade All Crates" },

       { "<leader>prt", function() require("crates").expand_plain_crate_to_inline_table() end, desc = "Extract into Inline Table" },
       { "<leader>prT", function() require("crates").extract_crate_into_table() end, desc = "Extract into Table" },

       { "<leader>prh", function() require("crates").open_homepage() end, desc = "Homepage" },
       { "<leader>prr", function() require("crates").open_repository() end, desc = "Repo" },
       { "<leader>prd", function() require("crates").open_documentation() end, desc = "Documentation" },
       { "<leader>prc", function() require("crates").open_crates_io() end, desc = "Crates.io" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>p"] = { name = " packages/dependencies" },
        ["<leader>pr"] = { name = "rust" },
      },
    },
  },
  {
    "luckasRanarison/nvim-devdocs",
    optional = true,
    ensure_installed = {
      "rust",
    },
  },
}
