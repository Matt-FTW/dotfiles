return {
  {
    "smoka7/multicursors.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "smoka7/hydra.nvim",
    },
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
  -- stylua: ignore
  keys = {
    { mode = { "v", "n" }, "<leader>m", "<cmd>MCstart<cr>", desc = "Multicursor" },
  },
    opts = {
      hint_config = {
        border = "rounded",
        position = "bottom-right",
      },
      generate_hints = {
        normal = true,
        insert = true,
        extend = true,
        config = {
          column_count = 1,
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local function is_active()
        local ok, hydra = pcall(require, "hydra.statusline")
        return ok and hydra.is_active()
      end

      local function get_name()
        local ok, hydra = pcall(require, "hydra.statusline")
        if ok then
          return hydra.get_name()
        end
        return ""
      end

      table.insert(opts.sections.lualine_b, { get_name, cond = is_active })
    end,
  },
}
