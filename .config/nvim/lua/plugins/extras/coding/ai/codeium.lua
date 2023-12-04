return {
  {
    "Exafunction/codeium.vim",
    event = "InsertEnter",
    config = function()
      vim.g.codeium_filetypes = { TelescopePrompt = false, DressingInput = false }

      vim.g.codeium_disable_bindings = 1

      vim.keymap.set("i", "<M-CR>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true, silent = true })

      vim.keymap.set("i", "<M-]>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true })

      vim.keymap.set("i", "<M-[>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true })

      vim.keymap.set("i", "<M-c>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true })

      vim.keymap.set("n", "<leader>cC", function()
        if vim.g.codeium_enabled == true then
          vim.cmd("CodeiumDisable")
        else
          vim.cmd("CodeiumEnable")
        end
      end, { noremap = true, desc = "Toggle Codeium" })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local icon = require("lazyvim.config").icons.kinds.Codeium
      local function show_codeium_status()
        return icon .. vim.fn["codeium#GetStatusString"]()
      end

      -- Insert the icon
      table.insert(opts.sections.lualine_x, 2, show_codeium_status)
    end,
  },
}
