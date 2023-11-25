local Util = require("lazyvim.util")

return {
  {
    "cljoly/telescope-repo.nvim",
    opts = {},
    config = function(_, opts)
      Util.on_load("telescope.nvim", function()
        require("telescope").setup({
          extensions = {
            repo = {
              list = {
                fd_opts = {
                  "--no-ignore-vcs",
                },
                search_dirs = {
                  "~/Repos",
                },
              },
            },
          },
        })
        require("telescope").load_extension("repo")
      end)
    end,
    keys = {
      { "<leader>fp", "<cmd>Telescope repo list<cr>", desc = "Projects (~/Repos)" },
      {
        "<leader>fP",
        "<cmd>lua require'telescope'.extensions.repo.list{search_dirs = { '~/' }}<cr>",
        desc = "Projects (System)",
      },
    },
  },
  {
    "goolord/alpha-nvim",
    opts = function(_, dashboard)
      local button = dashboard.button("p", " " .. " Projects/Repos", "<cmd>Telescope repo list <CR>")
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
      table.insert(dashboard.section.buttons.val, 4, button)
    end,
  },
  {
    "airblade/vim-rooter",
    event = "VeryLazy",
  },
}
