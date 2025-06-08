return {
  { import = "lazyvim.plugins.extras.lang.go" },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "golangci-lint",
      },
    },
  },
  {
    "ray-x/go.nvim",
    enabled = false,
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
    ft = { "go", "gomod" },
    build = function()
      require("go.install").update_all_sync()
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      local function add_linters(tbl)
        for ft, linters in pairs(tbl) do
          if opts.linters_by_ft[ft] == nil then
            opts.linters_by_ft[ft] = linters
          else
            vim.list_extend(opts.linters_by_ft[ft], linters)
          end
        end
      end

      add_linters({
        ["go"] = { "golangcilint" },
        ["gomod"] = { "golangcilint" },
        ["gowork"] = { "golangcilint" },
      })

      return opts
    end,
  },
  {
    "luckasRanarison/nvim-devdocs",
    optional = true,
    opts = {
      ensure_installed = {
        "go",
      },
    },
  },
}
