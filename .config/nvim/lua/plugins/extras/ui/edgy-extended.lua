return {
  "folke/edgy.nvim",
  opts = function()
    local opts = {
      animate = { enabled = false },
      bottom = {
        {
          ft = "toggleterm",
          size = { height = 0.4 },
          filter = function(buf, win)
            return vim.api.nvim_win_get_config(win).relative == ""
          end,
        },
        {
          ft = "noice",
          size = { height = 0.4 },
          filter = function(buf, win)
            return vim.api.nvim_win_get_config(win).relative == ""
          end,
        },
        "Trouble",
        { ft = "qf", title = "QuickFix" },
        {
          ft = "help",
          size = { height = 20 },
          -- don't open help files in edgy that we're editing
          filter = function(buf)
            return vim.bo[buf].buftype == "help"
          end,
        },
        { title = "Spectre", ft = "spectre_panel", size = { height = 0.4 } },
        { title = "Neotest Output", ft = "neotest-output-panel", size = { height = 15 } },
      },
      left = {
        { title = "Neotest Summary", ft = "neotest-summary" },
        -- "neo-tree",
      },
      right = {
        { title = "Grug Far", ft = "grug-far", size = { width = 0.4 } },
      },
      keys = {
        -- increase width
        ["<c-Right>"] = function(win)
          win:resize("width", 2)
        end,
        -- decrease width
        ["<c-Left>"] = function(win)
          win:resize("width", -2)
        end,
        -- increase height
        ["<c-Up>"] = function(win)
          win:resize("height", 2)
        end,
        -- decrease height
        ["<c-Down>"] = function(win)
          win:resize("height", -2)
        end,
      },
    }

    if LazyVim.has("neo-tree.nvim") then
      local pos = {
        filesystem = "left",
        buffers = "top",
        git_status = "right",
        document_symbols = "bottom",
        diagnostics = "bottom",
      }
      local sources = LazyVim.opts("neo-tree.nvim").sources or {}
      for i, v in ipairs(sources) do
        table.insert(opts.left, i, {
          title = "Neo-Tree " .. v:gsub("_", " "):gsub("^%l", string.upper),
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == v
          end,
          pinned = true,
          open = function()
            vim.cmd(("Neotree show position=%s %s dir=%s"):format(pos[v] or "bottom", v, LazyVim.root()))
          end,
        })
      end
    end

    for _, pos in ipairs({ "top", "bottom", "left", "right" }) do
      opts[pos] = opts[pos] or {}
      table.insert(opts[pos], {
        ft = "trouble",
        filter = function(_buf, win)
          return vim.w[win].trouble
            and vim.w[win].trouble.position == pos
            and vim.w[win].trouble.type == "split"
            and vim.w[win].trouble.relative == "editor"
            and not vim.w[win].trouble_preview
        end,
      })
    end

    return opts
  end,
}
