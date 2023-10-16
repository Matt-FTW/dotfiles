local Util = require("lazyvim.util")

return {
  {
    "nvim-telescope/telescope.nvim",
    commit = vim.fn.has("nvim-0.9.0") == 0 and "057ee0f8783" or nil,
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    dependencies = {
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
        "debugloop/telescope-undo.nvim",
        opts = {},
        event = "VeryLazy",
        config = function(_, opts)
          Util.on_load("telescope.nvim", function()
            require("telescope").load_extension("undo")
          end)
        end,
      },
      {
        "prochri/telescope-all-recent.nvim",
        event = "VeryLazy",
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
        "benfowler/telescope-luasnip.nvim",
        event = "VeryLazy",
        config = function()
          Util.on_load("telescope.nvim", function()
            require("telescope").load_extension("luasnip")
          end)
        end,
      },
      {
        "piersolenski/telescope-import.nvim",
        requires = "nvim-telescope/telescope.nvim",
        event = "VeryLazy",
        config = function(_, opts)
          Util.on_load("telescope.nvim", function()
            require("telescope").load_extension("import")
          end)
        end,
      },
      {
        "jvgrootveld/telescope-zoxide",
        event = "VeryLazy",
        config = function()
          Util.on_load("telescope.nvim", function()
            require("telescope").load_extension("zoxide")
          end)
        end,
      },
      {
        "tsakirist/telescope-lazy.nvim",
        event = "VeryLazy",
        config = function()
          Util.on_load("telescope.nvim", function()
            require("telescope").load_extension("lazy")
          end)
        end,
      },
    },
    keys = {
      {
        "<leader>,",
        "<cmd>Telescope buffers show_all_buffers=true<cr>",
        desc = "Switch Buffer",
      },
      {
        "<leader>/",
        Util.telescope("live_grep"),
        desc = "Grep (root dir)",
      },
      {
        "<leader>:",
        "<cmd>Telescope command_history<cr>",
        desc = "Command History",
      },
      {
        "<leader><space>",
        Util.telescope("files"),
        desc = "Find Files (root dir)",
      },
      -- find
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      {
        "<leader>ff",
        Util.telescope("files"),
        desc = "Find Files (root dir)",
      },
      {
        "<leader>fF",
        Util.telescope("files", { cwd = false }),
        desc = "Find Files (cwd)",
      },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      { "<leader>fR", Util.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },
      -- git
      { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
      { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
      -- search
      { '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Registers" },
      {
        "<leader>sa",
        "<cmd>Telescope autocommands<cr>",
        desc = "Auto Commands",
      },
      { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
      {
        "<leader>sc",
        "<cmd>Telescope command_history<cr>",
        desc = "Command History",
      },
      { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
      {
        "<leader>sd",
        "<cmd>Telescope diagnostics bufnr=0<cr>",
        desc = "Document diagnostics",
      },
      {
        "<leader>sD",
        "<cmd>Telescope diagnostics<cr>",
        desc = "Workspace diagnostics",
      },
      {
        "<leader>sg",
        Util.telescope("live_grep"),
        desc = "Grep (root dir)",
      },
      { "<leader>sG", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
      {
        "<leader>sH",
        "<cmd>Telescope highlights<cr>",
        desc = "Search Highlight Groups",
      },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
      { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
      { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
      { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
      { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
      { "<leader>cu", "<cmd>Telescope undo<cr>", desc = "Undotree" },
      {
        "<leader>sw",
        Util.telescope("grep_string", { word_match = "-w" }),
        desc = "Word (root dir)",
      },
      { "<leader>sW", Util.telescope("grep_string", { cwd = false, word_match = "-w" }), desc = "Word (cwd)" },
      {
        "<leader>sw",
        Util.telescope("grep_string"),
        mode = "v",
        desc = "Selection (root dir)",
      },
      {
        "<leader>sW",
        Util.telescope("grep_string", { cwd = false }),
        mode = "v",
        desc = "Selection (cwd)",
      },
      {
        "<leader>uC",
        Util.telescope("colorscheme", { enable_preview = true }),
        desc = "Colorscheme with preview",
      },
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
    opts = function()
      local actions = require("telescope.actions")
      local open_with_trouble = function(...)
        return require("trouble.providers.telescope").open_with_trouble(...)
      end

      local open_selected_with_trouble = function(...)
        return require("trouble.providers.telescope").open_selected_with_trouble(...)
      end

      local find_files_no_ignore = function()
        local action_state = require("telescope.actions.state")
        local line = action_state.get_current_line()
        Util.telescope("find_files", { no_ignore = true, default_text = line })()
      end

      local find_files_with_hidden = function()
        local action_state = require("telescope.actions.state")
        local line = action_state.get_current_line()
        Util.telescope("find_files", { hidden = true, default_text = line })()
      end

      return {
        defaults = {
          prompt_prefix = " ",
          selection_caret = " ",
          -- open files in the first window that is an actual file.
          -- use the current window if no other window is available.
          get_selection_window = function()
            local wins = vim.api.nvim_list_wins()
            table.insert(wins, 1, vim.api.nvim_get_current_win())
            for _, win in ipairs(wins) do
              local buf = vim.api.nvim_win_get_buf(win)
              if vim.bo[buf].buftype == "" then
                return win
              end
            end
            return 0
          end,
          mappings = {
            i = {
              ["<c-t>"] = open_with_trouble,
              ["<a-t>"] = open_selected_with_trouble,
              ["<a-i>"] = find_files_no_ignore,
              ["<a-h>"] = find_files_with_hidden,
              ["<C-Down>"] = actions.cycle_history_next,
              ["<C-Up>"] = actions.cycle_history_prev,
              ["<C-f>"] = actions.preview_scrolling_down,
              ["<C-b>"] = actions.preview_scrolling_up,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<esc>"] = actions.close,
              ["<C-u>"] = false,
              ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
            },
            n = {
              ["q"] = actions.close,
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
            undo = {
              side_by_side = true,
              layout_strategy = "vertical",
              layout_config = {
                preview_height = 0.65,
              },
            },
            import = {
              insert_at_top = true,
            },
            fzf = {
              fuzzy = true,
              override_generic_sorter = true,
              override_file_sorter = true,
              case_mode = "smart_case",
            },
          },
        },
        require("telescope").load_extension("refactoring"),
      }
    end,
  },
}
