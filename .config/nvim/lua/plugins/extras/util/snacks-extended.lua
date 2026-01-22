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
            ["<a-c>"] = { "cycle_preview", mode = { "i", "n" } },
          },
        },
      },
      actions = {
        cycle_preview = function(picker)
          local layout_config = vim.deepcopy(picker.resolved_layout)

          if layout_config.preview == "main" or not picker.preview.win:valid() then
            return
          end

          local function find_preview(root) ---@param root snacks.layout.Box|snacks.layout.Win
            if root.win == "preview" then
              return root
            end
            if #root then
              for _, w in ipairs(root) do
                local preview = find_preview(w)
                if preview then
                  return preview
                end
              end
            end
            return nil
          end

          local preview = find_preview(layout_config.layout)

          if not preview then
            return
          end

          local eval = function(s)
            return type(s) == "function" and s(preview.win) or s
          end
          --- @type number?, number?
          local width, height = eval(preview.width), eval(preview.height)

          if not width and not height then
            return
          end

          local cycle_sizes = { 0.1, 0.9 }
          local size_prop, size

          if height then
            size_prop, size = "height", height
          else
            size_prop, size = "width", width
          end

          picker.init_size = picker.init_size or size ---@diagnostic disable-line: inject-field
          table.insert(cycle_sizes, picker.init_size)
          table.sort(cycle_sizes)

          for i, s in ipairs(cycle_sizes) do
            if size == s then
              local smaller = cycle_sizes[i - 1] or cycle_sizes[#cycle_sizes]
              preview[size_prop] = smaller
              break
            end
          end

          for i, h in ipairs(layout_config.hidden) do
            if h == "preview" then
              table.remove(layout_config.hidden, i)
            end
          end

          picker:set_layout(layout_config)
        end,
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
    { "<leader>gb", function() Snacks.picker.git_log_line() end, desc = "Blame Line" },
    { "<leader>cil", function() Snacks.picker.lsp_config() end, desc = "Lsp" },
    { "<leader>sn", function() Snacks.picker.notifications() end, desc = "Notifications" },
    { "<leader>st", function() Snacks.picker.treesitter() end, desc = "Treesitter" },
    { "<leader>go", function() Snacks.gitbrowse() end, desc = "Git Open Line" },
  },
}
