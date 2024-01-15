return {
  "jellydn/gen.nvim",
  opts = {
    model = "codellama",
    display_mode = "split",
    show_prompt = true,
    show_model = true,
    no_auto_close = false,
    init = function(options)
      pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
    end,
    command = "curl --silent --no-buffer -X POST http://localhost:11434/api/generate -d $body",
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
    { "<leader>i", "<cmd>Gen<cr>", mode = { "n", "v" }, desc = "IA (Gen)" },
  },
}
