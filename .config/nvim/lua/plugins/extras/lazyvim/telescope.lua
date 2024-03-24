local actions = require("telescope.actions")

return {
  {
    "nvim-telescope/telescope.nvim",
    -- stylua: ignore
    keys = {
      {
        "<leader>ssa",
        LazyVim.telescope("lsp_document_symbols", { symbols = { "Class", "Function", "Method", "Constructor", "Interface", "Module", "Struct", "Trait", "Field", "Property", "Enum", "Constant" } }),
        desc = "All",
      },
      { "<leader>ssc", LazyVim.telescope("lsp_document_symbols", { symbols = { "Class" } }), desc = "Class" },
      { "<leader>ssf", LazyVim.telescope("lsp_document_symbols", { symbols = { "Function" } }), desc = "Function" },
      { "<leader>ssm", LazyVim.telescope("lsp_document_symbols", { symbols = { "Method" } }), desc = "Method" },
      { "<leader>ssC", LazyVim.telescope("lsp_document_symbols", { symbols = { "Constructor" } }), desc = "Constructor" },
      { "<leader>sse", LazyVim.telescope("lsp_document_symbols", { symbols = { "Enum" } }), desc = "Enum" },
      { "<leader>ssi", LazyVim.telescope("lsp_document_symbols", { symbols = { "Interface" } }), desc = "Interface" },
      { "<leader>ssM", LazyVim.telescope("lsp_document_symbols", { symbols = { "Module" } }), desc = "Module" },
      { "<leader>sss", LazyVim.telescope("lsp_document_symbols", { symbols = { "Struct" } }), desc = "Struct" },
      { "<leader>sst", LazyVim.telescope("lsp_document_symbols", { symbols = { "Trait" } }), desc = "Trait" },
      { "<leader>ssF", LazyVim.telescope("lsp_document_symbols", { symbols = { "Field" } }), desc = "Field" },
      { "<leader>ssp", LazyVim.telescope("lsp_document_symbols", { symbols = { "Property" } }), desc = "Property" },
      { "<leader>ssv", LazyVim.telescope("lsp_document_symbols", { symbols = { "Variable", "Parameter" } }), desc = "Variable" },
      {
        "<leader>sSa",
        LazyVim.telescope("lsp_dynamic_workspace_symbols", { symbols = { "Class", "Function", "Method", "Constructor", "Interface", "Module", "Struct", "Trait", "Field", "Property", "Enum", "Constant" } }),
        desc = "All",
      },
      { "<leader>sSc", LazyVim.telescope("lsp_dynamic_workspace_symbols", { symbols = { "Class" } }), desc = "Class" },
      { "<leader>sSf", LazyVim.telescope("lsp_dynamic_workspace_symbols", { symbols = { "Function" } }), desc = "Function" },
      { "<leader>sSm", LazyVim.telescope("lsp_dynamic_workspace_symbols", { symbols = { "Method" } }), desc = "Method" },
      { "<leader>sSC", LazyVim.telescope("lsp_dynamic_workspace_symbols", { symbols = { "Constructor" } }), desc = "Constructor" },
      { "<leader>sSe", LazyVim.telescope("lsp_dynamic_workspace_symbols", { symbols = { "Enum" } }), desc = "Enum" },
      { "<leader>sSi", LazyVim.telescope("lsp_dynamic_workspace_symbols", { symbols = { "Interface" } }), desc = "Interface" },
      { "<leader>sSM", LazyVim.telescope("lsp_dynamic_workspace_symbols", { symbols = { "Module" } }), desc = "Module" },
      { "<leader>sSs", LazyVim.telescope("lsp_dynamic_workspace_symbols", { symbols = { "Struct" } }), desc = "Struct" },
      { "<leader>sSt", LazyVim.telescope("lsp_dynamic_workspace_symbols", { symbols = { "Trait" } }), desc = "Trait" },
      { "<leader>sSF", LazyVim.telescope("lsp_dynamic_workspace_symbols", { symbols = { "Field" } }), desc = "Field" },
      { "<leader>sSp", LazyVim.telescope("lsp_dynamic_workspace_symbols", { symbols = { "Property" } }), desc = "Property" },
      { "<leader>sSv", LazyVim.telescope("lsp_dynamic_workspace_symbols", { symbols = { "Variable", "Parameter" } }), desc = "Variable" },
      { "<leader>sA", LazyVim.telescope("treesitter"), desc = "Treesitter Symbols" },
      { "<leader>sp", "<cmd>Telescope builtin<cr>", desc = "Pickers (Telescope)" },
      { "<leader>fh", LazyVim.telescope("find_files", { hidden = true }), desc = "Find Files (hidden)" },
      { "<leader><c-space>", LazyVim.telescope("find_files", { hidden = true }), desc = "Find Files (hidden)" },
      { "<leader>gf", "<cmd>Telescope git_bcommits<cr>", desc = "File History" },
      { "<leader>gS", "<cmd>Telescope git_stash<cr>", desc = "stash" },
      { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "branches" },
      { "<leader>cs", "<cmd>Telescope spell_suggest<cr>", desc = "Spelling" },
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
            prompt_position = "top",
            height = 0.5,
            width = 0.6,
          },
          sorting_strategy = "ascending",
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
      defaults = {
        ["<leader>sS"] = { name = "Goto Symbols (Workspace)" },
        ["<leader>ss"] = { name = "Goto Symbols" },
      },
    },
  },
}
