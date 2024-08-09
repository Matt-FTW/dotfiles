local prefix = "<leader>C"

return {
  {
    "jackMort/ChatGPT.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cond = function()
      local api_key = os.getenv("OPENAI_API_KEY")
      return api_key and api_key ~= "" and true or false
    end,
    opts = {
      edit_with_instructions = {
        diff = false,
        keymaps = {
          close = "<C-c>",
          accept = "<C-y>",
          toggle_diff = "<C-d>",
          toggle_settings = "<C-o>",
          cycle_windows = "<Tab>",
          use_output_as_input = "<C-i>",
        },
      },
      chat = {
        welcome_message = "",
        keymaps = {
          close = { "<C-c>" },
          yank_last = "<C-y>",
          yank_last_code = "<C-k>",
          scroll_up = "<C-u>",
          scroll_down = "<C-d>",
          new_session = "<C-n>",
          cycle_windows = "<Tab>",
          cycle_modes = "<C-f>",
          next_message = "<C-j>",
          prev_message = "<C-k>",
          select_session = { "<Space>", "o", "<cr>" },
          rename_session = "r",
          delete_session = "d",
          draft_message = "<C-d>",
          edit_message = "e",
          delete_message = "d",
          toggle_settings = "<C-o>",
          toggle_message_role = "<C-r>",
          toggle_system_role_open = "<C-s>",
          stop_generating = "<C-x>",
        },
      },
      openai_params = {
        model = "gpt-3.5-turbo-16k",
        -- model = "gpt-4",
        frequency_penalty = 0,
        presence_penalty = 0,
        max_tokens = 300,
        temperature = 0.3,
        top_p = 0.3,
        n = 1,
        -- temperature = 0,
        -- top_p = 1,
      },
      openai_edit_params = {
        model = "gpt-3.5-turbo-16k",
        -- model = "gpt-4",
        frequency_penalty = 0,
        presence_penalty = 0,
        temperature = 0,
        top_p = 1,
        n = 1,
      },
      show_quickfixes_cmd = "Trouble quickfix",
      -- actions_paths = { "~/.config/nvim/custom_actions.json" },
    },
    cmd = {
      "ChatGPT",
      "ChatGPTActAs",
      "ChatGPTCompleteCode",
      "ChatGPTEditWithInstructions",
      "ChatGPTRun",
    },
    -- stylua: ignore
    keys = {
      { prefix .. "c", "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
      { prefix .. "e", "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit With Instruction", mode = { "n", "v" } },
      { prefix .. "g", "<cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction", mode = { "n", "v" } },
      { prefix .. "t", "<cmd>ChatGPTRun translate<CR>", desc = "Translate", mode = { "n", "v" } },
      { prefix .. "k", "<cmd>ChatGPTRun keywords<CR>", desc = "Keywords", mode = { "n", "v" } },
      { prefix .. "d", "<cmd>ChatGPTRun docstring<CR>", desc = "Docstring", mode = { "n", "v" } },
      { prefix .. "T", "<cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests", mode = { "n", "v" } },
      { prefix .. "o", "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code", mode = { "n", "v" } },
      { prefix .. "s", "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize", mode = { "n", "v" } },
      { prefix .. "f", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs", mode = { "n", "v" } },
      { prefix .. "x", "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code", mode = { "n", "v" } },
      { prefix .. "r", "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit", mode = { "n", "v" } },
      { prefix .. "l", "<cmd>ChatGPTRun code_readability_analysis<CR>", desc = "Code Readability Analysis", mode = { "n", "v" }, },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { prefix, group = "chatGPT", icon = "󰚩 " },
      },
    },
  },
}
