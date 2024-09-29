return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make",
    opts = {
      openai = {
        endpoint = "http://127.0.0.1:11434",
        model = "deepseek-coder-v2",
        temperature = 60,
        max_tokens = 4096,
        ["local"] = true,
      },
    },
    dependencies = {
      "MeanderingProgrammer/render-markdown.nvim",
      ft = { "markdown", "norg", "rmd", "org", "Avante" },
    },
  },
}
