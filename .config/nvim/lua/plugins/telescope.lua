local Util = require("lazyvim.util")

return {
    {
        "nvim-telescope/telescope.nvim",
        commit = vim.fn.has("nvim-0.9.0") == 0 and "057ee0f8783" or nil,
        cmd = "Telescope",
        version = false, -- telescope did only one release, so use HEAD for now
        dependencies = {},
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
            { "<leader>fu", "<cmd>Telescope undo<cr>", desc = "Telescope Undotree" },
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
                "<leader>ss",
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
                    },
                }),
                desc = "Goto Symbol",
            },
            {
                "<leader>sS",
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
                    },
                }),
                desc = "Goto Symbol (Workspace)",
            },
            {
                "<leader>sv",
                Util.telescope("lsp_document_symbols", {
                    symbols = {
                        "Variable",
                        "Parameter",
                    },
                }),
                desc = "Variables",
            },
            {
                "<leader>sV",
                Util.telescope("lsp_dynamic_workspace_symbols", {
                    symbols = {
                        "Variable",
                        "Parameter",
                    },
                }),
                desc = "Variables (Workspace)",
            },
            {
                "<leader>sA",
                Util.telescope("treesitter"),
                desc = "Treesitter Symbols",
            },
        },
        opts = {
            defaults = {
                file_ignore_patterns = { "node_modules", "build", "dist", "yarn.lock", "*.git/*", "*/tmp/*", "Juegos/" },
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
            },
        },
    },
}
