local Util = require("lazyvim.util")
local actions = require("telescope.actions")

return {
  {
    "nvim-telescope/telescope.nvim",
    -- stylua: ignore
    keys = {
      {
        "<leader>ssa",
        Util.telescope("lsp_document_symbols", { symbols = { "Class", "Function", "Method", "Constructor", "Interface", "Module", "Struct", "Trait", "Field", "Property", "Enum", "Constant" } }),
        desc = "All",
      },
      { "<leader>ssc", Util.telescope("lsp_document_symbols", { symbols = { "Class" } }), desc = "Class" },
      { "<leader>ssf", Util.telescope("lsp_document_symbols", { symbols = { "Function" } }), desc = "Function" },
      { "<leader>ssm", Util.telescope("lsp_document_symbols", { symbols = { "Method" } }), desc = "Method" },
      { "<leader>ssC", Util.telescope("lsp_document_symbols", { symbols = { "Constructor" } }), desc = "Constructor" },
      { "<leader>sse", Util.telescope("lsp_document_symbols", { symbols = { "Enum" } }), desc = "Enum" },
      { "<leader>ssi", Util.telescope("lsp_document_symbols", { symbols = { "Interface" } }), desc = "Interface" },
      { "<leader>ssM", Util.telescope("lsp_document_symbols", { symbols = { "Module" } }), desc = "Module" },
      { "<leader>sss", Util.telescope("lsp_document_symbols", { symbols = { "Struct" } }), desc = "Struct" },
      { "<leader>sst", Util.telescope("lsp_document_symbols", { symbols = { "Trait" } }), desc = "Trait" },
      { "<leader>ssF", Util.telescope("lsp_document_symbols", { symbols = { "Field" } }), desc = "Field" },
      { "<leader>ssp", Util.telescope("lsp_document_symbols", { symbols = { "Property" } }), desc = "Property" },
      { "<leader>ssv", Util.telescope("lsp_document_symbols", { symbols = { "Variable", "Parameter" } }), desc = "Variable" },
      {
        "<leader>sSa",
        Util.telescope("lsp_dynamic_workspace_symbols", { symbols = { "Class", "Function", "Method", "Constructor", "Interface", "Module", "Struct", "Trait", "Field", "Property", "Enum", "Constant" } }),
        desc = "All",
      },
      { "<leader>sSc", Util.telescope("lsp_dynamic_workspace_symbols", { symbols = { "Class" } }), desc = "Class" },
      { "<leader>sSf", Util.telescope("lsp_dynamic_workspace_symbols", { symbols = { "Function" } }), desc = "Function" },
      { "<leader>sSm", Util.telescope("lsp_dynamic_workspace_symbols", { symbols = { "Method" } }), desc = "Method" },
      { "<leader>sSC", Util.telescope("lsp_dynamic_workspace_symbols", { symbols = { "Constructor" } }), desc = "Constructor" },
      { "<leader>sSe", Util.telescope("lsp_dynamic_workspace_symbols", { symbols = { "Enum" } }), desc = "Enum" },
      { "<leader>sSi", Util.telescope("lsp_dynamic_workspace_symbols", { symbols = { "Interface" } }), desc = "Interface" },
      { "<leader>sSM", Util.telescope("lsp_dynamic_workspace_symbols", { symbols = { "Module" } }), desc = "Module" },
      { "<leader>sSs", Util.telescope("lsp_dynamic_workspace_symbols", { symbols = { "Struct" } }), desc = "Struct" },
      { "<leader>sSt", Util.telescope("lsp_dynamic_workspace_symbols", { symbols = { "Trait" } }), desc = "Trait" },
      { "<leader>sSF", Util.telescope("lsp_dynamic_workspace_symbols", { symbols = { "Field" } }), desc = "Field" },
      { "<leader>sSp", Util.telescope("lsp_dynamic_workspace_symbols", { symbols = { "Property" } }), desc = "Property" },
      { "<leader>sSv", Util.telescope("lsp_dynamic_workspace_symbols", { symbols = { "Variable", "Parameter" } }), desc = "Variable" },
      { "<leader>sA", Util.telescope("treesitter"), desc = "Treesitter Symbols" },
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-r>"] = actions.delete_buffer,
            ["<C-j>"] = actions.move_selection_next,
            ["<S-esc>"] = actions.close,
            ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
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
        pickers = {
          find_files = {
            hidden = false,
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
