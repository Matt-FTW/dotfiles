return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "html",
        "css",
        "scss",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        emmet_language_server = {},
        html = {},
        cssmodules_ls = {},
        css_variables = {},
        cssls = {
          lint = {
            compatibleVendorPrefixes = "ignore",
            vendorPrefix = "ignore",
            unknownVendorSpecificProperties = "ignore",

            -- unknownProperties = "ignore", -- duplicate with stylelint

            duplicateProperties = "warning",
            emptyRules = "warning",
            importStatement = "warning",
            zeroUnits = "warning",
            fontFaceProperties = "warning",
            hexColorLength = "warning",
            argumentsInColorFunction = "warning",
            unknownAtRules = "warning",
            ieHack = "warning",
            propertyIgnoredDueToDisplay = "warning",
          },
        },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "emmet-language-server",
        "html-lsp",
        "cssmodules-language-server",
        "css-variables-language-server",
        "css-lsp",
        "htmlhint",
        "stylelint",
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      local stylelint = "stylelint"

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
        ["html"] = { "htmlhint" },
        ["css"] = { stylelint },
        ["scss"] = { stylelint },
        ["less"] = { stylelint },
        ["sugarss"] = { stylelint },
      })
      return opts
    end,
  },
  {
    "luckasRanarison/nvim-devdocs",
    optional = true,
    opts = {
      ensure_installed = {
        "html",
        "css",
        "sass",
      },
    },
  },
}
