return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        keys = {},
        header = [[
                                                                   
      ████ ██████           █████      ██                    
     ███████████             █████                            
     █████████ ███████████████████ ███   ███████████  
    █████████  ███    █████████████ █████ ██████████████  
   █████████ ██████████ █████████ █████ █████ ████ █████  
 ███████████ ███    ███ █████████ █████ █████ ████ █████ 
██████  █████████████████████ ████ █████ █████ ████ ██████
        ]],
      },
    },
    lazygit = {
      configure = false,
      win = {
        width = 0,
        height = 0,
      },
    },
    notifier = {
      style = "fancy",
    },
    terminal = {
      win = {
        position = "float",
      },
    },
    picker = {
      previewers = {
        git = {
          builtin = false,
        },
      },
      matcher = {
        frecency = true,
      },
      layouts = {
        default = {
          layout = {
            box = "horizontal",
            width = 0,
            height = 0,
            {
              box = "vertical",
              border = "rounded",
              title = "{title} {live} {flags}",
              { win = "input", height = 1, border = "bottom" },
              { win = "list", border = "none" },
            },
            { win = "preview", title = "{preview}", border = "rounded", width = 0.65 },
          },
        },
      },
      win = {
        input = {
          keys = {
            ["<c-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
            ["<a-j>"] = { "list_scroll_down", mode = { "i", "n" } },
            ["<c-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
            ["<a-k>"] = { "list_scroll_up", mode = { "i", "n" } },
          },
        },
      },
    },
    image = {
      enabled = true,
      doc = {
        inline = false,
      },
    },
    scroll = {
      animate = {
        duration = { step = 10, total = 100 },
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "<leader>fz", function() Snacks.picker.zoxide({
      finder = "files_zoxide",
      format = "file",
      -- confirm = "load_session" -- Disable loading session by default.
      confirm = function(picker, item)
        picker:close()
        if item then
          Snacks.picker.files({ cwd = item.text })
        end
        local dir = item.file
        vim.fn.chdir(dir)
      end,
      win = {
        preview = {
          minimal = true,
        },
      },
    }) end, desc = "Zoxide" },
    { "<leader>gb", function() Snacks.picker.git_log_line() end, desc = "Blame Line"},
    { "<leader>cil", function() Snacks.picker.lsp_config() end, desc = "Lsp"},
    { "<leader>sn", function() Snacks.picker.notifications() end, desc = "Notifications" },
    { "<leader>st", function() Snacks.picker.treesitter() end, desc = "Treesitter" },
    { "<leader>go", function() Snacks.gitbrowse() end, desc = "Git Open Line" },
  },
}
