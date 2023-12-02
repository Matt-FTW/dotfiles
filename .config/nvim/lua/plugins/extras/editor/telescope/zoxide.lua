return {
  {
    "jvgrootveld/telescope-zoxide",
    config = function()
      require("lazyvim.util").on_load("telescope.nvim", function()
        require("telescope").setup({
          extensions = {
            zoxide = {
              mappings = {
                default = {
                  after_action = function(selection)
                    -- require("telescope.builtin").find_files({ cwd = selection.path }) FIXME: this doesn't work
                  end,
                },
              },
            },
          },
        })
        require("telescope").load_extension("zoxide")
      end)
    end,
    keys = {
      { "<leader>fz", "<cmd>Telescope zoxide list<CR>", desc = "Zoxide" },
    },
  },
  {
    "goolord/alpha-nvim",
    opts = function(_, dashboard)
      local button = dashboard.button("z", " " .. " Zoxide", "<cmd>Telescope zoxide list <CR>")
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
      table.insert(dashboard.section.buttons.val, 5, button)
    end,
  },
}
