local Util = require("lazyvim.util")
local actions = require("telescope.actions")

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "piersolenski/telescope-import.nvim",
        config = function(_, opts)
          Util.on_load("telescope.nvim", function()
            require("telescope").setup({
              extensions = {
                import = {
                  insert_at_top = true,
                },
              },
            })
            require("telescope").load_extension("import")
          end)
        end,
        keys = {
          { "<leader>si", "<cmd>Telescope import<CR>", desc = "Imports" },
        },
      },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        enabled = vim.fn.executable("make") == 1,
        config = function()
          Util.on_load("telescope.nvim", function()
            require("telescope").load_extension("fzf")
          end)
        end,
      },
      {
        "prochri/telescope-all-recent.nvim",
        dependencies = {
          "kkharji/sqlite.lua",
        },
        opts = {
          pickers = {
            ["workspaces.nvim#workspaces"] = {
              disable = false,
              sorting = "frecency",
            },
            ["project.nvim#projects"] = {
              disable = false,
              sorting = "frecency",
            },
            ["yanky.nvim#yank_history"] = {
              disable = true,
            },
            ["zoxide.nvim#zoxide"] = {
              disable = true,
            },
          },
        },
      },
      {
        "nvim-telescope/telescope-dap.nvim",
        config = function()
          Util.on_load("telescope.nvim", function()
            require("telescope").load_extension("dap")
          end)
        end,
      },
      {
        "benfowler/telescope-luasnip.nvim",
        config = function()
          Util.on_load("telescope.nvim", function()
            require("telescope").load_extension("luasnip")
          end)
        end,
      },
      {
        "jvgrootveld/telescope-zoxide",
        config = function(_, opts)
          Util.on_load("telescope.nvim", function()
            require("telescope").setup({
              extensions = {
                zoxide = {
                  mappings = {
                    default = {
                      after_action = function(selection)
                        require("telescope.builtin").find_files({ cwd = selection.path })
                      end,
                    },
                  },
                },
              },
            })
            require("telescope").load_extension("zoxide")
          end)
        end,
      },
      {
        "tsakirist/telescope-lazy.nvim",
        config = function()
          Util.on_load("telescope.nvim", function()
            require("telescope").load_extension("lazy")
          end)
        end,
      },
    },
    keys = {
      {
        "<leader>dm",
        "<cmd>Telescope dap commands<CR>",
        desc = "Commands",
      },
      {
        "<leader>df",
        "<cmd>Telescope dap frames<CR>",
        desc = "Frames",
      },
      {
        "<leader>dG",
        "<cmd>Telescope dap configurations<CR>",
        desc = "Configurations",
      },
      {
        "<leader>dL",
        "<cmd>Telescope dap list_breakpoints<CR>",
        desc = "List Breakpoints",
      },
      {
        "<leader>dv",
        "<cmd>Telescope dap variables<CR>",
        desc = "Variables",
      },
      { "<leader>fz", "<cmd>Telescope zoxide list<CR>", desc = "Zoxide" },
      { "<leader>sp", "<cmd>Telescope lazy<CR>", desc = "Plugins (Lazy)" },
      { "<leader>sl", "<cmd>Telescope luasnip<CR>", desc = "Luasnip (Snippets)" },
      {
        "<leader>ssa",
        Util.telescope("lsp_document_symbols", {
          symbols = {
            "Class",
            "Function",
            "Method",
            "Constructor",
            "Interface",
            "Module",
            "Struct",
            "Trait",
            "Field",
            "Property",
            "Enum",
            "Constant",
          },
        }),
        desc = "All",
      },
      {
        "<leader>ssc",
        Util.telescope("lsp_document_symbols", {
          symbols = {
            "Class",
          },
        }),
        desc = "Class",
      },
      {
        "<leader>ssf",
        Util.telescope("lsp_document_symbols", {
          symbols = {
            "Function",
          },
        }),
        desc = "Function",
      },
      {
        "<leader>ssm",
        Util.telescope("lsp_document_symbols", {
          symbols = {
            "Method",
          },
        }),
        desc = "Method",
      },
      {
        "<leader>ssC",
        Util.telescope("lsp_document_symbols", {
          symbols = {
            "Constructor",
          },
        }),
        desc = "Constructor",
      },
      {
        "<leader>sse",
        Util.telescope("lsp_document_symbols", {
          symbols = {
            "Enum",
          },
        }),
        desc = "Enum",
      },
      {
        "<leader>ssi",
        Util.telescope("lsp_document_symbols", {
          symbols = {
            "Interface",
          },
        }),
        desc = "Interface",
      },
      {
        "<leader>ssM",
        Util.telescope("lsp_document_symbols", {
          symbols = {
            "Module",
          },
        }),
        desc = "Module",
      },
      {
        "<leader>sss",
        Util.telescope("lsp_document_symbols", {
          symbols = {
            "Struct",
          },
        }),
        desc = "Struct",
      },
      {
        "<leader>sst",
        Util.telescope("lsp_document_symbols", {
          symbols = {
            "Trait",
          },
        }),
        desc = "Trait",
      },
      {
        "<leader>ssF",
        Util.telescope("lsp_document_symbols", {
          symbols = {
            "Field",
          },
        }),
        desc = "Field",
      },
      {
        "<leader>ssp",
        Util.telescope("lsp_document_symbols", {
          symbols = {
            "Property",
          },
        }),
        desc = "Property",
      },
      {
        "<leader>ssv",
        Util.telescope("lsp_document_symbols", {
          symbols = {
            "Variable",
            "Parameter",
          },
        }),
        desc = "Variable",
      },
      {
        "<leader>sSa",
        Util.telescope("lsp_dynamic_workspace_symbols", {
          symbols = {
            "Class",
            "Function",
            "Method",
            "Constructor",
            "Interface",
            "Module",
            "Struct",
            "Trait",
            "Field",
            "Property",
            "Enum",
            "Constant",
          },
        }),
        desc = "All",
      },
      {
        "<leader>sSc",
        Util.telescope("lsp_dynamic_workspace_symbols", {
          symbols = {
            "Class",
          },
        }),
        desc = "Class",
      },
      {
        "<leader>sSf",
        Util.telescope("lsp_dynamic_workspace_symbols", {
          symbols = {
            "Function",
          },
        }),
        desc = "Function",
      },
      {
        "<leader>sSm",
        Util.telescope("lsp_dynamic_workspace_symbols", {
          symbols = {
            "Method",
          },
        }),
        desc = "Method",
      },
      {
        "<leader>sSC",
        Util.telescope("lsp_dynamic_workspace_symbols", {
          symbols = {
            "Constructor",
          },
        }),
        desc = "Constructor",
      },
      {
        "<leader>sSe",
        Util.telescope("lsp_dynamic_workspace_symbols", {
          symbols = {
            "Enum",
          },
        }),
        desc = "Enum",
      },
      {
        "<leader>sSi",
        Util.telescope("lsp_dynamic_workspace_symbols", {
          symbols = {
            "Interface",
          },
        }),
        desc = "Interface",
      },
      {
        "<leader>sSM",
        Util.telescope("lsp_dynamic_workspace_symbols", {
          symbols = {
            "Module",
          },
        }),
        desc = "Module",
      },
      {
        "<leader>sSs",
        Util.telescope("lsp_dynamic_workspace_symbols", {
          symbols = {
            "Struct",
          },
        }),
        desc = "Struct",
      },
      {
        "<leader>sSt",
        Util.telescope("lsp_dynamic_workspace_symbols", {
          symbols = {
            "Trait",
          },
        }),
        desc = "Trait",
      },
      {
        "<leader>sSF",
        Util.telescope("lsp_dynamic_workspace_symbols", {
          symbols = {
            "Field",
          },
        }),
        desc = "Field",
      },
      {
        "<leader>sSp",
        Util.telescope("lsp_dynamic_workspace_symbols", {

          symbols = {
            "Property",
          },
        }),
        desc = "Property",
      },
      {
        "<leader>sSv",
        Util.telescope("lsp_dynamic_workspace_symbols", {
          symbols = {
            "Variable",
            "Parameter",
          },
        }),
        desc = "Variable",
      },
      {
        "<leader>sA",
        Util.telescope("treesitter"),
        desc = "Treesitter Symbols",
      },
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<esc>"] = actions.close,
            ["<C-u>"] = false,
            ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
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
            hidden = true,
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>sS"] = { name = "+Goto Symbols (Workspace)" },
        ["<leader>ss"] = { name = "+Goto Symbols" },
      },
    },
  },
  {
    "axieax/urlview.nvim",
    cmd = { "UrlView" },
    keys = { { "<leader>sU", "<cmd>UrlView<cr>", desc = "Search Urls" } },
    opts = {
      default_picker = "telescope",
    },
  },
}
