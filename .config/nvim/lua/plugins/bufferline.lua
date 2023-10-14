local macchiato = require("catppuccin.palettes").get_palette("macchiato")
return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = {
      "catppuccin",
    },
    keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
    },
    opts = {
      highlights = require("catppuccin.groups.integrations.bufferline").get({
        styles = { "italic", "bold" },
        custom = {
          all = {
            fill = { bg = macchiato.mantle },
            background = { bg = macchiato.mantle },
          },
        },
      }),
      options = {
        buffer_close_icon = "",
        modified_icon = "",
        close_icon = "",
        color_icons = true,
        close_command = function(n)
          require("mini.bufremove").delete(n, false)
        end,
        separator_style = "slope",
        right_mouse_command = function(n)
          require("mini.bufremove").delete(n, false)
        end,
        themable = true,
        view = "multiwindow",
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        diagnostics_indicator = function(_, _, diag)
          local icons = require("lazyvim.config").icons.diagnostics
          local ret = (diag.error and icons.Error .. diag.error .. " " or "")
            .. (diag.warning and icons.Warn .. diag.warning or "")
          return vim.trim(ret)
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
  },
}
