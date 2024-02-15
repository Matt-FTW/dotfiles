return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "http" })
      end
    end,
  },
  {
    "rest-nvim/rest.nvim",
    dependencies = {
      {
        "gennaro-tedesco/nvim-jqx",
        ft = { "json", "yaml" },
      },
    },
    ft = { "http" },
    opts = {
      -- Open request results in a horizontal split
      result_split_horizontal = true,
      -- Keep the http file buffer above|left when split horizontal|vertical
      result_split_in_place = false,
      -- Skip SSL verification, useful for unknown certificates
      skip_ssl_verification = false,
      -- Encode URL before making request
      encode_url = true,
      -- Highlight request on run
      highlight = {
        enabled = true,
        timeout = 150,
      },
      result = {
        -- toggle showing URL, HTTP info, headers at top the of result window
        show_url = true,
        show_http_info = true,
        show_headers = true,
        -- executables or functions for formatting response body [optional]
        -- set them to false if you want to disable them
        formatters = {
          json = "jq",
          html = function(body)
            return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
          end,
        },
      },
      -- Jump to request line on run
      jump_to_request = false,
      env_file = ".env",
      custom_dynamic_variables = {},
      yank_dry_run = true,
    },
    config = function(_, opts)
      require("rest-nvim").setup(opts)
      require("lazyvim.util").on_load("telescope.nvim", function()
        require("telescope").load_extension("rest")
      end)
    end,
    -- stylua: ignore
    keys = {
      { "<leader>thp", function() require("rest-nvim").run(true) end, desc = "Preview Request" },
      { "<leader>thr", function() require("rest-nvim").run() end, desc = "Run Request" },
      { "<leader>sv", function() require("telescope").extensions.rest.select_env() end, desc = "Env Files" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>th"] = { name = "http" },
      },
    },
  },
}
