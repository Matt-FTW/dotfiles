return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            opts.autotag = {
                enable = true,
            }

            opts.endwise = {
                enable = true,
            }

            vim.list_extend(opts.ensure_installed, {
                "arduino",
                "diff",
                "dart",
                "css",
                "c_sharp",
                "comment",
                "fish",
                "git_config",
                "git_rebase",
                "gitattributes",
                "gitcommit",
                "gitignore",
                "groovy",
                "hjson",
                "http",
                "ini",
                "luadoc",
                "make",
                "kotlin",
                "julia",
                "meson",
                "perl",
                "php",
                "prisma",
                "r",
                "rasi",
                "regex",
                "ruby",
                "sql",
                "scss",
                "slint",
                "svelte",
                "todotxt",
                "vim",
                "vue",
            })
        end,
    },
}
