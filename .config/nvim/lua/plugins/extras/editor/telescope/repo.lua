return {
  {
    "cljoly/telescope-repo.nvim",
    dependencies = {
      "airblade/vim-rooter",
      init = function()
        vim.g["rooter_cd_cmd"] = "lcd"
        vim.g["rooter_silent_chdir"] = 1
      end,
    },
    opts = {},
    config = function()
      require("lazyvim.util").on_load("telescope.nvim", function()
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
    -- stylua: ignore
    keys = {
      { "<leader>fp", "<cmd>Telescope repo list<cr>", desc = "Projects (~/Repos)" },
      { "<leader>fP", "<cmd>lua require'telescope'.extensions.repo.list{search_dirs = { '~/' }}<cr>", desc = "Projects (System)" },
    },
  },
  {
    "goolord/alpha-nvim",
    optional = true,
    opts = function(_, dashboard)
      local button = dashboard.button("p", " " .. " Projects/Repos", "<cmd>Telescope repo list <CR>")
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
      table.insert(dashboard.section.buttons.val, 4, button)
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    optional = true,
    opts = function(_, opts)
      local projects = {
        action = "Telescope repo list",
        desc = " Projects/Repos",
        icon = " ",
        key = "p",
      }

      projects.desc = projects.desc .. string.rep(" ", 43 - #projects.desc)
      projects.key_format = "  %s"

      table.insert(opts.config.center, 4, projects)
    end,
  },
}
