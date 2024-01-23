return {
  "epwalsh/obsidian.nvim",
  ft = "markdown",
  keys = {
    {
      "gf",
      function()
        if require("obsidian").util.cursor_on_markdown_link() then
          return "<cmd>ObsidianFollowLink<CR>"
        else
          return "gf"
        end
      end,
      noremap = false,
      expr = true,
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Documentos/Obsidian/obsidianVault/root",
      },
    },
    daily_notes = {
      folder = "Journal/Entries/Daily",
      date_format = "%Y-%m-%d",
      alias_format = "%B %-d, %Y",
      template = "_data_/templates/journal/daily_entry.md",
    },

    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle check-boxes.
      ["<C-c>"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
    },

    templates = {
      subdir = "_data_/templates",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M",
    },

    backlinks = { height = 10, wrap = true },

    -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
    -- URL it will be ignored but you can customize this behavior here.
    follow_url_func = function(url)
      -- Open the URL in the default web browser.
      vim.fn.jobstart({ "xdg-open", url }) -- linux
    end,

    -- Optional, set to true if you use the Obsidian Advanced URI plugin.
    -- https://github.com/Vinzent03/obsidian-advanced-uri
    use_advanced_uri = false,

    -- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
    open_app_foreground = false,

    finder = "telescope.nvim",

    open_notes_in = "current",

    attachments = {
      img_folder = "_data_/media",
    },

    note_frontmatter_func = function(note)
      -- This is equivalent to the default frontmatter function.
      local out = { id = note.id, aliases = note.aliases, tags = note.tags }
      -- `note.metadata` contains any manually added fields in the frontmatter.
      -- So here we just make sure those fields are kept in the frontmatter.
      if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end
      return out
    end,
  },
}
