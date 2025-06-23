return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
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
        duration = { step = 10, total = 150 },
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
    { "<leader>S", function() Snacks.picker.spelling() end, desc = "Spelling" },
    { "<leader>B", function() Snacks.picker.buffers({
      on_show = function()
        vim.cmd.stopinsert()
      end,
      current = false,
      sort_lastused = true,
    }) end, desc = "Buffers" },
    { "<leader>,", function() Snacks.picker.buffers({
      on_show = function()
        vim.cmd.stopinsert()
      end,
      current = false,
      sort_lastused = true,
    }) end, desc = "Buffers" },
    { "<leader>gB", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
    { "<leader>go", function() Snacks.gitbrowse() end, desc = "Git Open Line" },
  },
}
