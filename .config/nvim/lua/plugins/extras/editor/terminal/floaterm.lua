return {
  {
    "voldikss/vim-floaterm",
    cmd = { "FloatermNew", "FloatermToggle", "FloatermNext", "FloatermPrev", "FloatermLast", "FloatermFirst" },
    --stylua: ignore
    keys = {
      { "<A-e>", "<cmd>FloatermNew --disposable --name=yaziroot --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<root> yazi<CR>", desc = "Yazi" },
      { "<leader>gg", "<cmd>FloatermNew --name=lazygitroot --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<root> lazygit<CR>", desc = "Lazygit (root dir)" },
      { "<leader>gG", "<cmd>FloatermNew --name=lazygitbuffer --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<buffer> lazygit<CR>", desc = "Lazygit (cwd)" },
      { "<leader>cen", "<cmd>FloatermNew --name=node --opener=edit --titleposition=center --wintype=split --height=0.35 node<CR>", desc = "Node" },
      { "<leader>cep", "<cmd>FloatermNew --name=python --opener=edit --titleposition=center --wintype=split --height=0.35 python<CR>", desc = "Python" },
      { "<S-Right>", "<Esc><Esc><cmd>FloatermNext<CR>", mode = { "t" }, desc = "Next Terminal" },
      { "<S-Left>", "<Esc><Esc><cmd>FloatermPrev<CR>", mode = { "t" }, desc = "Prev Terminal" },
      { "<A-Right>", "<Esc><Esc><cmd>FloatermLast<CR>", mode = { "t" }, desc = "Last Terminal" },
      { "<A-Left>", "<Esc><Esc><cmd>FloatermFirst<CR>", mode = { "t" }, desc = "First Terminal" },
      { [[<c-\>]], "<cmd>FloatermToggle<cr>", mode = { "n", "t" }, desc = "Toggle Terminal" },
      { "<leader>ftf", "<cmd>FloatermNew --name=floatroot --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<root><cr>", desc = "Floating (root dir)" },
      { "<leader>ftF", "<cmd>FloatermNew --name=floatbuffer --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<buffer><cr>", desc = "Floating (cwd)" },
      { "<leader>fts", "<cmd>FloatermNew --name=splitroot --opener=edit --titleposition=center --height=0.35 --wintype=split --cwd=<root><cr>", desc = "Split (root dir)" },
      { "<leader>ftS", "<cmd>FloatermNew --name=splitbuffer --opener=edit --titleposition=center --height=0.35 --wintype=split --cwd=<buffer><cr>", desc = "Split (cwd)" },
    },
  },
  {
    "dawsers/telescope-floaterm.nvim",
    config = function()
      require("lazyvim.util").on_load("telescope.nvim", function()
        require("telescope").load_extension("floaterm")
      end)
    end,
    keys = {
      { [[<A-\>]], "<cmd>Telescope floaterm<cr>", desc = "Terminals" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>ce"] = { name = "r[e]pl" },
        ["<leader>ft"] = { name = "terminals" },
      },
    },
  },
  {
    "folke/edgy.nvim",
    optional = true,
    opts = function(_, opts)
      table.insert(opts.bottom, {
        ft = "floaterm",
        title = "Floaterm",
        size = { height = 0.4 },
        filter = function(buf, win)
          return vim.api.nvim_win_get_config(win).relative == ""
        end,
      })
    end,
  },
  {
    "goolord/alpha-nvim",
    optional = true,
    opts = function(_, dashboard)
    -- stylua: ignore
      local button = dashboard.button("G", "󰊢 " .. " Git",       "<cmd>FloatermNew --disposable --name=lazygitroot --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<root> lazygit<CR>")
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
      table.insert(dashboard.section.buttons.val, 7, button)
      return dashboard
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    optional = true,
    opts = function(_, opts)
      local git = {
        action = "FloatermNew --disposable --name=lazygitroot --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<root> lazygit",
        desc = " Git",
        icon = " ",
        key = "G",
      }

      git.desc = git.desc .. string.rep(" ", 43 - #git.desc)
      git.key_format = "  %s"

      table.insert(opts.config.center, 7, git)
    end,
  },
}
