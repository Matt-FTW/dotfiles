local symbols_prefix = "<leader>ss"
local symbols_workspace_prefix = "<leader>sS"
local actions = require("telescope.actions")

return {
  { import = "lazyvim.plugins.extras.editor.telescope" },
  {
    "nvim-telescope/telescope.nvim",
    -- stylua: ignore
    keys = {
      {
        symbols_prefix .. "a",
        LazyVim.pick("lsp_document_symbols", { symbols = { "Class", "Function", "Method", "Constructor", "Interface", "Module", "Struct", "Trait", "Field", "Property", "Enum", "Constant" } }),
        desc = "All",
      },
      { symbols_prefix .. "c", LazyVim.pick("lsp_document_symbols", { symbols = { "Class" } }), desc = "Class" },
      { symbols_prefix .. "f", LazyVim.pick("lsp_document_symbols", { symbols = { "Function" } }), desc = "Function" },
      { symbols_prefix .. "m", LazyVim.pick("lsp_document_symbols", { symbols = { "Method" } }), desc = "Method" },
      { symbols_prefix .. "C", LazyVim.pick("lsp_document_symbols", { symbols = { "Constructor" } }), desc = "Constructor" },
      { symbols_prefix .. "e", LazyVim.pick("lsp_document_symbols", { symbols = { "Enum" } }), desc = "Enum" },
      { symbols_prefix .. "i", LazyVim.pick("lsp_document_symbols", { symbols = { "Interface" } }), desc = "Interface" },
      { symbols_prefix .. "M", LazyVim.pick("lsp_document_symbols", { symbols = { "Module" } }), desc = "Module" },
      { symbols_prefix .. "s", LazyVim.pick("lsp_document_symbols", { symbols = { "Struct" } }), desc = "Struct" },
      { symbols_prefix .. "t", LazyVim.pick("lsp_document_symbols", { symbols = { "Trait" } }), desc = "Trait" },
      { symbols_prefix .. "F", LazyVim.pick("lsp_document_symbols", { symbols = { "Field" } }), desc = "Field" },
      { symbols_prefix .. "p", LazyVim.pick("lsp_document_symbols", { symbols = { "Property" } }), desc = "Property" },
      { symbols_prefix .. "v", LazyVim.pick("lsp_document_symbols", { symbols = { "Variable", "Parameter" } }), desc = "Variable" },
      {
        symbols_workspace_prefix .. "a",
        LazyVim.pick("lsp_dynamic_workspace_symbols", { symbols = { "Class", "Function", "Method", "Constructor", "Interface", "Module", "Struct", "Trait", "Field", "Property", "Enum", "Constant" } }),
        desc = "All",
      },
      { symbols_workspace_prefix .. "c", LazyVim.pick("lsp_dynamic_workspace_symbols", { symbols = { "Class" } }), desc = "Class" },
      { symbols_workspace_prefix .. "f", LazyVim.pick("lsp_dynamic_workspace_symbols", { symbols = { "Function" } }), desc = "Function" },
      { symbols_workspace_prefix .. "m", LazyVim.pick("lsp_dynamic_workspace_symbols", { symbols = { "Method" } }), desc = "Method" },
      { symbols_workspace_prefix .. "C", LazyVim.pick("lsp_dynamic_workspace_symbols", { symbols = { "Constructor" } }), desc = "Constructor" },
      { symbols_workspace_prefix .. "e", LazyVim.pick("lsp_dynamic_workspace_symbols", { symbols = { "Enum" } }), desc = "Enum" },
      { symbols_workspace_prefix .. "i", LazyVim.pick("lsp_dynamic_workspace_symbols", { symbols = { "Interface" } }), desc = "Interface" },
      { symbols_workspace_prefix .. "M", LazyVim.pick("lsp_dynamic_workspace_symbols", { symbols = { "Module" } }), desc = "Module" },
      { symbols_workspace_prefix .. "s", LazyVim.pick("lsp_dynamic_workspace_symbols", { symbols = { "Struct" } }), desc = "Struct" },
      { symbols_workspace_prefix .. "t", LazyVim.pick("lsp_dynamic_workspace_symbols", { symbols = { "Trait" } }), desc = "Trait" },
      { symbols_workspace_prefix .. "F", LazyVim.pick("lsp_dynamic_workspace_symbols", { symbols = { "Field" } }), desc = "Field" },
      { symbols_workspace_prefix .. "p", LazyVim.pick("lsp_dynamic_workspace_symbols", { symbols = { "Property" } }), desc = "Property" },
      { symbols_workspace_prefix .. "v", LazyVim.pick("lsp_dynamic_workspace_symbols", { symbols = { "Variable", "Parameter" } }), desc = "Variable" },
      { "<leader>sA", LazyVim.pick("treesitter"), desc = "Treesitter Symbols" },
      { "<leader>sP", "<cmd>Telescope builtin<cr>", desc = "Pickers (Telescope)" },
      { "<leader>fh", LazyVim.pick("find_files", { hidden = true }), desc = "Find Files (hidden)" },
      { "<leader><c-space>", LazyVim.pick("find_files", { hidden = true }), desc = "Find Files (hidden)" },
      { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Branches" },
      { "<leader>S", "<cmd>Telescope spell_suggest<cr>", desc = "Spelling" },
      { "<leader>gs", false },
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<S-esc>"] = actions.close,
            ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
            ["<c-l>"] = require("telescope.actions.layout").cycle_layout_next,
            ["<a-l>"] = require("telescope.actions.layout").cycle_layout_prev,
            ["<C-Down>"] = actions.cycle_history_next,
            ["<C-Up>"] = actions.cycle_history_prev,
            ["<C-Tab>"] = require("telescope.actions").select_tab_drop,
            ["<M-h>"] = require("telescope.actions").results_scrolling_left,
            ["<M-l>"] = require("telescope.actions").results_scrolling_right,
          },
        },
        file_ignore_patterns = {
          ".gitignore",
          "node_modules",
          "build",
          "dist",
          "yarn.lock",
          "*.git/*",
          "*/tmp/*",
        },
      },
      pickers = {
        find_files = {
          hidden = false,
        },
        buffers = {
          layout_config = {
            height = 0.7,
            width = 0.7,
          },
          mappings = {
            i = {
              ["<c-r>"] = require("telescope.actions").delete_buffer,
            },
          },
        },
        spell_suggest = {
          layout_config = {
            prompt_position = "top",
            height = 0.3,
            width = 0.25,
          },
          sorting_strategy = "ascending",
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { symbols_prefix, group = "goto symbols", icon = " " },
        { symbols_workspace_prefix, group = "goto symbols (Workspace)", icon = " " },
      },
    },
  },
}
