local group = vim.api.nvim_create_augroup("PersistedHooks", {})

vim.api.nvim_create_autocmd({ "User" }, {
  pattern = "PersistedTelescopeLoadPre",
  group = group,
  callback = function(session)
    -- Save the currently loaded session using a global variable
    require("persisted").save({ session = vim.g.persisted_loaded_session })

    -- Delete all of the open buffers
    vim.api.nvim_input("<ESC>:%bd!<CR>")
  end,
})

return {
  {
    "folke/persistence.nvim",
    enabled = false,
  },
  {
    "olimorris/persisted.nvim",
    lazy = false,
    config = function()
      LazyVim.on_load("telescope.nvim", function()
        require("telescope").setup({
          extensions = {
            persisted = {
              layout_config = {
                height = 0.6,
                width = 0.6,
              },
            },
          },
        })
        require("telescope").load_extension("persisted")
      end)
      require("persisted").setup({
        use_git_branch = true,
        autoload = false,
        should_autosave = function()
          if vim.bo.filetype == "dashboard" then
            return false
          end
          return true
        end,
      })
    end,
    keys = {
      {
        "<leader>ql",
        function()
          require("persisted").load()
        end,
        desc = "Load Session",
      },
      {
        "<leader>qL",
        function()
          require("persisted").load({ last = true })
        end,
        desc = "Load Last Session",
      },
      {
        "<leader>qS",
        function()
          require("persisted").stop()
        end,
        desc = "Stop Current Session",
      },
      {
        "<leader>qs",
        function()
          require("persisted").save()
        end,
        desc = "Save Current Session (Telescope)",
      },
      {
        "<leader>qT",
        function()
          require("persisted").start()
        end,
        desc = "Start Recording Current Session",
      },
      {
        "<leader>qt",
        "<cmd>Telescope persisted<cr>",
        desc = "Search Sessions (Telescope)",
      },
    },
  },
}
