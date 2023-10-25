return {
  {
    "LunarVim/bigfile.nvim",
    event = "VeryLazy",
    opts = {
      filesize = 1, -- size of the file in MiB, the plugin round file sizes to the closest MiB
      pattern = { "*" }, -- autocmd pattern or function see <### Overriding the detection of big files>
      features = { -- features to disable
        "indent_blankline",
        "illuminate",
        "lsp",
        "treesitter",
        "syntax",
        "vimopts",
        "matchparen",
      },
    },
  },
  {
    "max397574/better-escape.nvim",
    enabled = false,
    config = function()
      require("better_escape").setup({
        mapping = { "jk", "jj", "kj", "jl" }, -- a table with mappings to use
        timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
        clear_empty_lines = false, -- clear line after escaping if there is only whitespace
        keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
        -- example(recommended)
        -- keys = function()
        --   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
        -- end,
      })
    end,
  },
  {
    "monaqa/dial.nvim",
    event = "VeryLazy",
    -- splutylua: ignore
    keys = {
      {
        "<C-a>",
        function()
          return require("dial.map").inc_normal()
        end,
        expr = true,
        desc = "Increment",
      },
      {
        "<C-x>",
        function()
          return require("dial.map").dec_normal()
        end,
        expr = true,
        desc = "Decrement",
      },
    },
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.bool,
          augend.constant.new({ elements = { "let", "const" } }),
          augend.semver.alias.semver,
        },
      })
    end,
  },
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    enabled = false,
    event = "VeryLazy",
    keys = {
      { "<leader>uH", "<cmd>Hardtime toggle<CR>", desc = "Toggle Hardtime" },
    },
    opts = {
      disabled_filetypes = {
        "qf",
        "netrw",
        "NvimTree",
        "lazy",
        "mason",
        "oil",
        "neo-tree",
        "symbols-outline",
        "vim-be-good",
      },
      restriction_mode = "hint",
      restricted_keys = {
        ["h"] = { "n", "x" },
        ["l"] = { "n", "x" },
        ["-"] = { "n", "x" },
        ["+"] = { "n", "x" },
        ["gj"] = { "n", "x" },
        ["gk"] = { "n", "x" },
        ["<C-N>"] = { "n", "x" },
        ["<C-P>"] = { "n", "x" },
      },
      disabled_keys = {
        ["<Up>"] = { "" },
        ["<Down>"] = { "" },
        ["<Left>"] = { "" },
        ["<Right>"] = { "" },
      },
    },
  },
  {
    "mrjones2014/smart-splits.nvim",
    build = "./kitty/install-kittens.bash",
  -- stylua: ignore
  keys = {
    { "<C-A-Left>",   function() require("smart-splits").resize_left() end,       desc = "Resize left",       mode = "n" },
    { "<C-A-Down>",   function() require("smart-splits").resize_down() end,       desc = "Resize down",       mode = "n" },
    { "<C-A-Up>",   function() require("smart-splits").resize_up() end,         desc = "Resize up",         mode = "n" },
    { "<C-A-Right>",   function() require("smart-splits").resize_right() end,      desc = "Resize right",      mode = "n" },
    { "<C-h>",   function() require("smart-splits").move_cursor_left() end,  desc = "Move cursor left",  mode = "n" },
    { "<C-j>",   function() require("smart-splits").move_cursor_down() end,  desc = "Move cursor down",  mode = "n" },
    { "<C-k>",   function() require("smart-splits").move_cursor_up() end,    desc = "Move cursor up",    mode = "n" },
    { "<C-l>",   function() require("smart-splits").move_cursor_right() end, desc = "Move cursor right", mode = "n" },
    { "<C-A-h>", function() require("smart-splits").swap_buf_left() end,     desc = "Swap buffer left",  mode = "n" },
    { "<C-A-j>", function() require("smart-splits").swap_buf_down() end,     desc = "Swap buffer down",  mode = "n" },
    { "<C-A-k>", function() require("smart-splits").swap_buf_up() end,       desc = "Swap buffer up",    mode = "n" },
    { "<C-A-l>", function() require("smart-splits").swap_buf_right() end,    desc = "Swap buffer right", mode = "n" },
  },
  },
  {
    "lambdalisue/suda.vim",
    keys = {
      {
        "<leader>W",
        ":SudaWrite<CR>",
        desc = "Suda Write",
      },
    },
    cmd = {
      "SudaRead",
      "SudaWrite",
    },
  },
  {
    "chrisgrieser/nvim-spider",
    lazy = true,
    enabled = false,
    opts = {},
    keys = {
      { "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" }, desc = "Spider-w" },
      { "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" }, desc = "Spider-e" },
      { "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" }, desc = "Spider-b" },
      { "ge", "<cmd>lua require('spider').motion('ge')<CR>", mode = { "n", "o", "x" }, desc = "Spider-ge" },
    },
  },
  {
    "TobinPalmer/rayso.nvim",
    cmd = { "Rayso" },
    keys = {
      { "<leader>cS", "<cmd>Rayso<cr>", mode = { "n" }, desc = "Screenshot Code" },
      { "<leader>cS", "<cmd>'<,'>Rayso<cr>", mode = { "v" }, desc = "Screenshot Selection" },
    },
    opts = {
      open_cmd = "librewolf",
    },
  },
  {
    "bennypowers/nvim-regexplainer",
    opts = {},
    event = "BufReadPost",
    requires = {
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "Wansmer/treesj",
    keys = {
      { "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
    },
    opts = { use_default_keymaps = false, max_join_length = 150 },
  },
  { "wakatime/vim-wakatime", lazy = false },
  {
    "mbbill/undotree",
    event = "BufReadPost",
  },
  {
    "echasnovski/mini.align",
    opts = {},
    keys = {
      { "ga", mode = { "n", "v" }, desc = "Align" },
      { "gA", mode = { "n", "v" }, desc = "Align Preview" },
    },
  },
  {
    "ThePrimeagen/vim-be-good",
    cmd = "VimBeGood",
  },
  {
    "vidocqh/auto-indent.nvim",
    enabled = false,
    event = "BufReadPost",
    opts = {},
  },
}
