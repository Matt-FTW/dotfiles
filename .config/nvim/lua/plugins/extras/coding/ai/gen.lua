local prefix = "<leader>a"

return {
  {
    "jellydn/gen.nvim",
    opts = {
      model = "codellama",
      host = "localhost",
      port = "11434",
      display_mode = "split",
      show_prompt = true,
      show_model = true,
      no_auto_close = false,
      init = function(options)
        pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
      end,
      command = function(options)
        local body = { model = options.model, stream = true }
        return "curl --silent --no-buffer -X POST http://"
          .. options.host
          .. ":"
          .. options.port
          .. "/api/generate -d $body"
      end,
    },
    config = function(_, opts)
      local gen = require("gen")
      gen.setup(opts)

      gen.prompts["Elaborate_Text"] = {
        prompt = "Elaborate the following text:\n$text",
      }
      gen.prompts["Fix_Code"] = {
        prompt = "Fix the following code. Only output the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
        extract = "```$filetype\n(.-)```",
      }
    end,
    keys = {
      { prefix .. "i", "<cmd>Gen<cr>", mode = { "n", "v" }, desc = "IA (Gen)" },
      { prefix .. "g", "<cmd>Gen Generate<cr>", mode = { "n" }, desc = "Generate" },
      { prefix .. "c", "<cmd>Gen Chat<cr>", mode = { "n" }, desc = "Chat" },
      { prefix .. "s", "<cmd>Gen Summarize<cr>", mode = { "n", "v" }, desc = "Summarize" },
      { prefix .. "a", "<cmd>Gen Ask<cr>", mode = { "v" }, desc = "Ask" },
      { prefix .. "H", "<cmd>Gen Change<cr>", mode = { "v" }, desc = "Change" },
      { prefix .. "G", "<cmd>Gen Enhance_Grammar_Spelling<cr>", mode = { "v" }, desc = "Enhance Grammar Spelling" },
      { prefix .. "w", "<cmd>Gen Enhance_Wording<cr>", mode = { "v" }, desc = "Enhance Wording" },
      { prefix .. "C", "<cmd>Gen Make_Concise<cr>", mode = { "v" }, desc = "Make Concise" },
      { prefix .. "l", "<cmd>Gen Make_List<cr>", mode = { "v" }, desc = "Make List" },
      { prefix .. "t", "<cmd>Gen Make_Table<cr>", mode = { "v" }, desc = "Make Table" },
      { prefix .. "r", "<cmd>Gen Review_Code<cr>", mode = { "v" }, desc = "Review Code" },
      { prefix .. "e", "<cmd>Gen Enhance_Code<cr>", mode = { "v" }, desc = "Enhance Code" },
      { prefix .. "h", "<cmd>Gen Change_Code<cr>", mode = { "v" }, desc = "Change Code" },
      { prefix .. "f", "<cmd>Gen Fix_Code<cr>", mode = { "v" }, desc = "Fix Code" },
      { prefix .. "E", "<cmd>Gen Elaborate_Text<cr>", mode = { "v" }, desc = "Elaborate Text" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { prefix, group = "IA (Gen)", icon = "󱚦 " },
      },
    },
  },
}
