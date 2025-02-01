return {
  {
    "Exafunction/codeium.vim",
    event = "InsertEnter",
    config = function()
      if vim.g.codeium_cmp_hide == true then
        local cmp = require("cmp")
        cmp.event:on("menu_opened", function()
          vim.g.codeium_manual = true
          vim.fn["codeium#Clear"]()
        end)
        cmp.event:on("menu_closed", function()
          vim.g.codeium_manual = false
          vim.fn["codeium#Complete"]()
        end)
      end

      vim.g.codeium_filetypes = {
        TelescopePrompt = false,
        DressingInput = false,
        ["neo-tree-popup"] = false,
        ["dap-repl"] = false,
        ["snacks_picker_input"] = false,
      }

      local opts = { expr = true, silent = true }
      vim.g.codeium_disable_bindings = 1

      vim.keymap.set("i", "<M-CR>", function()
        return vim.fn["codeium#Accept"]()
      end, opts)

      vim.keymap.set("n", "<leader>ch", function()
        return vim.fn["codeium#Chat"]()
      end, { desc = "Chat with IA (Codeium)" })

      vim.keymap.set("i", "<M-]>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, opts)

      vim.keymap.set("i", "<M-[>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, opts)

      vim.keymap.set("i", "<M-c>", function()
        return vim.fn["codeium#Clear"]()
      end, opts)

      vim.keymap.set("n", "<leader>cI", "<cmd>CodeiumToggle<cr>", { desc = "Toggle IA (Codeium)" })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
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
