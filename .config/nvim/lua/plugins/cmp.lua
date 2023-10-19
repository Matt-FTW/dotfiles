local cmp = require("cmp")

return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "vuki656/package-info.nvim",
        event = { "BufRead package.json" },
        opts = {},
      },
      {
        "petertriho/cmp-git",
      },
      {
        "amarakon/nvim-cmp-fonts",
      },
    },
    opts = function(_, opts)
      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
        }),
      })

      cmp.setup.filetype("css", {
        sources = cmp.config.sources({
          { name = "fonts", option = { space_filter = "-" } }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
        }),
      })
      opts.mapping = cmp.mapping.preset.insert({
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.scroll_docs(-4),
        ["<C-n>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<S-CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-CR>"] = function(fallback)
          cmp.abort()
          fallback()
        end,
      })
      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }
    end,
  },
}
