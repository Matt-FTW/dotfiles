return {
  {
    "johmsalas/text-case.nvim",
    opts = {
      default_keymappings_enabled = false,
    },
    -- stylua: ignore
    keys = {
      { "gCu", "<cmd>lua require('textcase').current_word('to_upper_case')<cr>", mode = { "n", "v" }, desc = "UPPER CASE",  },
      { "gCl", "<cmd>lua require('textcase').current_word('to_lower_case')<CR>", mode = { "n", "v" }, desc = "lower case",  },
      { "gCs", "<cmd>lua require('textcase').current_word('to_snake_case')<CR>", mode = { "n", "v" }, desc = "snake_case",  },
      { "gCd", "<cmd>lua require('textcase').current_word('to_dash_case')<CR>", mode = { "n", "v" }, desc = "dash-case",  },
      { "gCn", "<cmd>lua require('textcase').current_word('to_constant_case')<CR>", mode = { "n", "v" }, desc = "CONSTANT_CASE",  },
      { "gCd", "<cmd>lua require('textcase').current_word('to_dot_case')<CR>", mode = { "n", "v" }, desc = "dot.case",  },
      { "gCa", "<cmd>lua require('textcase').current_word('to_phrase_case')<CR>", mode = { "n", "v" }, desc = "phrase case",  },
      { "gCc", "<cmd>lua require('textcase').current_word('to_camel_case')<CR>", mode = { "n", "v" }, desc = "camelCase",  },
      { "gCp", "<cmd>lua require('textcase').current_word('to_pascal_case')<CR>", mode = { "n", "v" }, desc = "PascalCase",  },
      { "gCt", "<cmd>lua require('textcase').current_word('to_title_case')<CR>", mode = { "n", "v" }, desc = "Title Case",  },
      { "gCf", "<cmd>lua require('textcase').current_word('to_path_case')<CR>", mode = { "n", "v" }, desc = "path/case",  },

      -- LSP
      { "gCU", "<cmd>lua require('textcase').lsp_rename('to_upper_case')<CR>", mode = { "n", "v" }, desc = "lsp - UPPER CASE",  },
      { "gCL", "<cmd>lua require('textcase').lsp_rename('to_lower_case')<CR>", mode = { "n", "v" }, desc = "lsp - lower case",  },
      { "gCS", "<cmd>lua require('textcase').lsp_rename('to_snake_case')<CR>", mode = { "n", "v" }, desc = "lsp - snake_case",  },
      { "gCD", "<cmd>lua require('textcase').lsp_rename('to_dash_case')<CR>", mode = { "n", "v" }, desc = "lsp - dash-case",  },
      { "gCN", "<cmd>lua require('textcase').lsp_rename('to_constant_case')<CR>", mode = { "n", "v" }, desc = "lsp - CONSTANT_CASE",  },
      { "gCD", "<cmd>lua require('textcase').lsp_rename('to_dot_case')<CR>", mode = { "n", "v" }, desc = "lsp - dot.case",  },
      { "gCA", "<cmd>lua require('textcase').lsp_rename('to_phrase_case')<CR>", mode = { "n", "v" }, desc = "lsp - phrase case",  },
      { "gCC", "<cmd>lua require('textcase').lsp_rename('to_camel_case')<CR>", mode = { "n", "v" }, desc = "lsp - camelCase",  },
      { "gCP", "<cmd>lua require('textcase').lsp_rename('to_pascal_case')<CR>", mode = { "n", "v" }, desc = "lsp - PascalCase",  },
      { "gCT", "<cmd>lua require('textcase').lsp_rename('to_title_case')<CR>", mode = { "n", "v" }, desc = "lsp - Title Case",  },
      { "gCF", "<cmd>lua require('textcase').lsp_rename('to_path_case')<CR>", mode = { "n", "v" }, desc = "lsp - path/case",  },

      -- Operator
      { "gCou", "<cmd>lua require('textcase').operator('to_upper_case')<CR>", mode = { "n", "v" }, desc = "UPPER CASE",  },
      { "gCol", "<cmd>lua require('textcase').operator('to_lower_case')<CR>", mode = { "n", "v" }, desc = "lower case",  },
      { "gCos", "<cmd>lua require('textcase').operator('to_snake_case')<CR>", mode = { "n", "v" }, desc = "snake_case",  },
      { "gCod", "<cmd>lua require('textcase').operator('to_dash_case')<CR>", mode = { "n", "v" }, desc = "dash-case",  },
      { "gCon", "<cmd>lua require('textcase').operator('to_constant_case')<CR>", mode = { "n", "v" }, desc = "CONSTANT_CASE",  },
      { "gCod", "<cmd>lua require('textcase').operator('to_dot_case')<CR>", mode = { "n", "v" }, desc = "dot.case",  },
      { "gCoa", "<cmd>lua require('textcase').operator('to_phrase_case')<CR>", mode = { "n", "v" }, desc = "phrase case",  },
      { "gCoc", "<cmd>lua require('textcase').operator('to_camel_case')<CR>", mode = { "n", "v" }, desc = "camelCase",  },
      { "gCop", "<cmd>lua require('textcase').operator('to_pascal_case')<CR>", mode = { "n", "v" }, desc = "PascalCase",  },
      { "gCot", "<cmd>lua require('textcase').operator('to_title_case')<CR>", mode = { "n", "v" }, desc = "Title Case",  },
      { "gCof", "<cmd>lua require('textcase').operator('to_path_case')<CR>", mode = { "n", "v" }, desc = "path/case",  },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["gC"] = { name = "+text case" },
        ["gCo"] = { name = "+operator" },
      },
    },
  },
}
