return {
    {
        "folke/edgy.nvim",
        event = "VeryLazy",
        keys = {
            {
                "<leader>ue",
                function()
                    require("edgy").toggle()
                end,
                desc = "Edgy Toggle",
            },
            -- stylua: ignore
            { "<leader>uE", function() require("edgy").select() end, desc = "Edgy Select Window" },
        },
        opts = function()
            local opts = {
                left = {
                    {
                        title = "Neo-Tree",
                        ft = "neo-tree",
                        filter = function(buf)
                            return vim.b[buf].neo_tree_source == "filesystem"
                        end,
                        pinned = true,
                        open = function()
                            vim.api.nvim_input("<esc><space>e")
                        end,
                        size = { height = 0.5 },
                    },
                    --[[ { title = "Neotest Summary", ft = "neotest-summary" },
                    {
                        title = "Neo-Tree Git",
                        ft = "neo-tree",
                        filter = function(buf)
                            return vim.b[buf].neo_tree_source == "git_status"
                        end,
                        pinned = true,
                        open = "Neotree position=right git_status",
                    }, ]]
                    {
                        title = "Neo-Tree Symbols",
                        ft = "neo-tree",
                        filter = function(buf)
                            return vim.b[buf].neo_tree_source == "document_symbols"
                        end,
                        pinned = true,
                        open = "Neotree position=top document_symbols",
                    },
                    "neo-tree",
                },
                keys = {
                    -- increase width
                    ["<c-Right>"] = function(win)
                        win:resize("width", 2)
                    end,
                    -- decrease width
                    ["<c-Left>"] = function(win)
                        win:resize("width", -2)
                    end,
                    -- increase height
                    ["<c-Up>"] = function(win)
                        win:resize("height", 2)
                    end,
                    -- decrease height
                    ["<c-Down>"] = function(win)
                        win:resize("height", -2)
                    end,
                },
            }
            local Util = require("lazyvim.util")
            if Util.has("symbols-outline.nvim") then
                table.insert(opts.left, {
                    title = "Outline",
                    ft = "Outline",
                    pinned = true,
                    open = "SymbolsOutline",
                })
            end
            return opts
        end,
    },
}
