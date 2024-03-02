if vim.fn.has("nvim-0.10") == 1 then
  return {
    {
      "nvim-treesitter/playground",
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSInstall query",
        opts = {
          playground = {
            enable = true,
          },
          query_linter = {
            enable = true,
            use_virtual_text = true,
            lint_events = { "BufWrite", "CursorHold" },
          },
        },
      },
      keys = {
        { "<leader>ciT", "<Cmd>TSHighlightCapturesUnderCursor<CR>", desc = "Treesitter Highlight Groups" },
        { "<leader>cit", "<Cmd>TSPlaygroundToggle<CR>", desc = "Treesitter Playground" },
      },
    },
    {
      "folke/edgy.nvim",
      optional = true,
      opts = function(_, opts)
        opts.right = opts.right or {}
        table.insert(opts.right, {
          title = "TS Playground",
          ft = "tsplayground",
          pinned = true,
          open = "TSPlaygroundToggle",
          size = { width = 0.3 },
        })
      end,
    },
  }
else
  vim.notify("Treesitter Playground only works with the nightly build")
end
