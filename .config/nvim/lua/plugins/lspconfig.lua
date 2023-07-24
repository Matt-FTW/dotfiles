return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                eslint = {
                    settings = {
                        -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
                        workingDirectory = { mode = "auto" },
                    },
                },
                pyright = {},
                ruff_lsp = {},
                neocmake = {},
                dockerls = {},
                docker_compose_language_service = {},
                gopls = {
                    keys = {
                        -- Workaround for the lack of a DAP strategy in neotest-go: https://github.com/nvim-neotest/neotest-go/issues/12
                        { "<leader>td", "<cmd>lua require('dap-go').debug_test()<CR>", desc = "Debug Nearest (Go)" },
                    },
                    settings = {
                        gopls = {
                            gofumpt = true,
                            codelenses = {
                                gc_details = false,
                                generate = true,
                                regenerate_cgo = true,
                                run_govulncheck = true,
                                test = true,
                                tidy = true,
                                upgrade_dependency = true,
                                vendor = true,
                            },
                            hints = {
                                assignVariableTypes = true,
                                compositeLiteralFields = true,
                                compositeLiteralTypes = true,
                                constantValues = true,
                                functionTypeParameters = true,
                                parameterNames = true,
                                rangeVariableTypes = true,
                            },
                            analyses = {
                                fieldalignment = true,
                                nilness = true,
                                unusedparams = true,
                                unusedwrite = true,
                                useany = true,
                            },
                            usePlaceholders = true,
                            completeUnimported = true,
                            staticcheck = true,
                            directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
                            semanticTokens = true,
                        },
                    },
                },
                jdtls = {
                    -- stylua: ignore
                    keys = {
                        {
                            "<leader>co",
                            function() require("jdtls").organize_imports() end,
                            desc =
                            "Organize Imports",
                        },
                        {
                            "<leader>cR",
                            function() require("jdtls").rename_file() end,
                            desc =
                            "Rename File",
                        },
                        {
                            "<leader>cxv",
                            function() require("jdtls").extract_variable() end,
                            desc =
                            "Extract Variable",
                        },
                        {
                            "<leader>cxv",
                            function() require("jdtls").extract_variable({ visual = true }) end,
                            mode = "v",
                            desc =
                            "Extract Variable",
                        },
                        {
                            "<leader>cxc",
                            function() require("jdtls").extract_constant() end,
                            desc =
                            "Extract Constant",
                        },
                        {
                            "<leader>cxc",
                            function() require("jdtls").extract_constant({ visual = true }) end,
                            mode = "v",
                            desc =
                            "Extract Constant",
                        },
                        {
                            "<leader>cxm",
                            function() require("jdtls").extract_method({ visual = true }) end,
                            mode = "v",
                            desc =
                            "Extract Method",
                        },
                    },
                },
                rust_analyzer = {
                    keys = {
                        { "K",          "<cmd>RustHoverActions<cr>", desc = "Hover Actions (Rust)" },
                        { "<leader>cR", "<cmd>RustCodeAction<cr>",   desc = "Code Action (Rust)" },
                        { "<leader>dr", "<cmd>RustDebuggables<cr>",  desc = "Run Debuggables (Rust)" },
                    },
                    settings = {
                        ["rust-analyzer"] = {
                            cargo = {
                                allFeatures = true,
                                loadOutDirsFromCheck = true,
                                runBuildScripts = true,
                            },
                            -- Add clippy lints for Rust.
                            checkOnSave = {
                                allFeatures = true,
                                command = "clippy",
                                extraArgs = { "--no-deps" },
                            },
                            procMacro = {
                                enable = true,
                                ignored = {
                                    ["async-trait"] = { "async_trait" },
                                    ["napi-derive"] = { "napi" },
                                    ["async-recursion"] = { "async_recursion" },
                                },
                            },
                        },
                    },
                },
                taplo = {
                    keys = {
                        {
                            "K",
                            function()
                                if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
                                    require("crates").show_popup()
                                else
                                    vim.lsp.buf.hover()
                                end
                            end,
                            desc = "Show Crate Documentation",
                        },
                    },
                },
            },
            tsserver = {
                keys = {
                    { "<leader>co", "<cmd>TypescriptOrganizeImports<CR>", desc = "Organize Imports" },
                    { "<leader>cR", "<cmd>TypescriptRenameFile<CR>",      desc = "Rename File" },
                },
                settings = {
                    typescript = {
                        format = {
                            indentSize = vim.o.shiftwidth,
                            convertTabsToSpaces = vim.o.expandtab,
                            tabSize = vim.o.tabstop,
                        },
                    },
                    javascript = {
                        format = {
                            indentSize = vim.o.shiftwidth,
                            convertTabsToSpaces = vim.o.expandtab,
                            tabSize = vim.o.tabstop,
                        },
                    },
                    completions = {
                        completeFunctionCalls = true,
                    },
                },
            },
        },
        setup = {
            rust_analyzer = function(_, opts)
                local rust_tools_opts = require("lazyvim.util").opts("rust-tools.nvim")
                require("rust-tools").setup(vim.tbl_deep_extend("force", rust_tools_opts or {}, { server = opts }))
                return true
            end,
            ruff_lsp = function()
                require("lazyvim.util").on_attach(function(client, _)
                    if client.name == "ruff_lsp" then
                        -- Disable hover in favor of Pyright
                        client.server_capabilities.hoverProvider = false
                    end
                end)
            end,

            gopls = function(_, opts)
                -- workaround for gopls not supporting semanticTokensProvider
                -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
                require("lazyvim.util").on_attach(function(client, _)
                    if client.name == "gopls" then
                        if not client.server_capabilities.semanticTokensProvider then
                            local semantic = client.config.capabilities.textDocument.semanticTokens
                            client.server_capabilities.semanticTokensProvider = {
                                full = true,
                                legend = {
                                    tokenTypes = semantic.tokenTypes,
                                    tokenModifiers = semantic.tokenModifiers,
                                },
                                range = true,
                            }
                        end
                    end
                end)
                -- end workaround
            end,

            jdtls = function()
                -- The lspconfig configuration for jdtls contains two useful items:
                -- 1. The list of filetypes on which to match.
                -- 2. Custom method for finding the root for a java project.
                local lsp_config = require("lspconfig.server_configurations.jdtls").default_config
                local find_java_project_root = lsp_config.root_dir
                local filetypes = lsp_config.filetypes

                -- Attach jdtls for the proper filetypes (i.e. java).
                -- Existing server will be reused if the root_dir matches.
                vim.api.nvim_create_autocmd("FileType", {
                    group = vim.api.nvim_create_augroup("MyJdtls", { clear = true }),
                    pattern = filetypes,
                    callback = function()
                        local fname = vim.api.nvim_buf_get_name(0)
                        local root_dir = find_java_project_root(fname)
                        local project_name = root_dir and vim.fs.basename(root_dir)
                        local cmd = { "jdtls" }
                        if project_name then
                            local jdtls_cache_dir = vim.fs.joinpath(vim.fn.stdpath("cache"), "jdtls", project_name)
                            vim.list_extend(cmd, {
                                "-configuration",
                                vim.fs.joinpath(jdtls_cache_dir, "config"),
                                "-data",
                                vim.fs.joinpath(jdtls_cache_dir, "workspace"),
                            })
                        end
                        require("jdtls").start_or_attach({
                            cmd = cmd,
                            root_dir = root_dir,
                        })
                        require("which-key").register({ c = { x = { name = "Extract" } } }, { prefix = "<leader>" })
                    end,
                })

                return true -- avoid duplicate servers
            end,

            tsserver = function(_, opts)
                require("typescript").setup({ server = opts })
                return true
            end,

            eslint = function()
                vim.api.nvim_create_autocmd("BufWritePre", {
                    callback = function(event)
                        if not require("lazyvim.plugins.lsp.format").enabled() then
                            -- exit early if autoformat is not enabled
                            return
                        end

                        local client = vim.lsp.get_active_clients({ bufnr = event.buf, name = "eslint" })[1]
                        if client then
                            local diag = vim.diagnostic.get(event.buf,
                                { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
                            if #diag > 0 then
                                vim.cmd("EslintFixAll")
                            end
                        end
                    end,
                })
            end,
        },
    },
}
