return {
  {
    "akinsho/nvim-toggleterm.lua",
    cmd = "ToggleTerm",
    opts = {
      -- size can be a number or function which is passed the current terminal
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true, -- hide the number column in toggleterm buffers
      shade_filetypes = {},
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true, -- whether or not the open mapping applies in insert mode
      persist_size = true,
      persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
      direction = "float",
      close_on_exit = false, -- close the terminal window when the process exits
      shell = "/bin/fish", -- change the default shell
      auto_scroll = true, -- automatically scroll to the bottom on terminal output
      -- This field is only relevant if direction is set to 'float'
      float_opts = {
        -- The border key is *almost* the same as 'nvim_win_open'
        -- see :h nvim_win_open for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
        border = "curved",
        -- width = <value>,
        -- height = <value>,
        winblend = 3,
        highlights = { border = "Normal", background = "Normal" },
      },
    },
    keys = {
      { [[<c-\>]], "<cmd>ToggleTerm<CR>", mode = "n", desc = "Toggle terminal" },
    },
  },
}
