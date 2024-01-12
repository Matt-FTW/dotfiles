return {
  {
    "voldikss/vim-floaterm",
    cmd = { "FloatermNew", "FloatermToggle", "FloatermNext", "FloatermPrev", "FloatermLast", "FloatermFirst" },
    --stylua: ignore
    keys = {
      { "<leader>Ts", "<cmd>FloatermNew --disposable --name=duaroot --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<root> dua i<CR>", desc = "Workspace Size (root dir)" },
      { "<leader>TS", "<cmd>FloatermNew --disposable --name=duabuffer --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<buffer> dua i<CR>", desc = "Workspace Size (cwd)" },
      { "<A-e>", "<cmd>FloatermNew --disposable --name=yaziroot --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<root> yazi<CR>", desc = "File Explorer (root dir)" },
      { "<leader>gg", "<cmd>FloatermNew --name=lazygitroot --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<root> lazygit<CR>", desc = "Lazygit (root dir)" },
      { "<leader>gG", "<cmd>FloatermNew --name=lazygitbuffer --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<buffer> lazygit<CR>", desc = "Lazygit (cwd)" },
      { "<leader>Td", "<cmd>FloatermNew --disposable --name=lazydocker --opener=edit --titleposition=center --height=0.85 --width=0.85 lazydocker<CR>", desc = "Lazydocker" },
      { "<leader>Tb", "<cmd>FloatermNew --disposable --name=btop --opener=edit --titleposition=center --height=0.85 --width=0.85 btop<CR>", desc = "Btop" },
      { "<leader>Tn", "<cmd>FloatermNew --disposable --name=navi --opener=edit --titleposition=center --height=0.85 --width=0.85 pages<CR>", desc = "Navi Pages" },
      { "<leader>Tp", "<cmd>FloatermNew --disposable --name=proc --opener=edit --titleposition=center --height=0.85 --width=0.85 proc<CR>", desc = "Systemd Processes" },
      { "<leader>TB", "<cmd>FloatermNew --disposable --name=bandwhich --opener=edit --titleposition=center --height=0.85 --width=0.85 bandwhich<CR>", desc = "Bandwidth" },
      { "<leader>gF", "<cmd>FloatermNew --disposable --name=forgit --opener=edit --titleposition=center --height=0.85 --width=0.85 fgit<CR>", desc = "Forgit" },
      { "<leader>gf", "<cmd>FloatermNew! --disposable --name=onefetch --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<root> gfetch<CR>", desc = "Gitfetch" },
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
        ["<leader>T"] = { name = " tools" },
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
