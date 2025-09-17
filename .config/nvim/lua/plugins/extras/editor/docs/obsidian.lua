local prefix = "<leader>o"

return {
  { import = "plugins.extras.lang.markdown-extended" },
  {
    -- "epwalsh/obsidian.nvim",
    "obsidian-nvim/obsidian.nvim", -- NOTE: Using a fork from the community
    -- ft = "markdown",
    event = "BufReadPre " .. vim.fn.expand("~") .. "/documents/obsidian/**.md",
    keys = {
      { prefix .. "o", "<cmd>Obsidian open<CR>", desc = "Open on App" },
      { prefix .. "g", "<cmd>Obsidian search<CR>", desc = "Grep" },
      { prefix .. "n", "<cmd>Obsidian new<CR>", desc = "New Note" },
      { prefix .. "N", "<cmd>Obsidian new_from_template<CR>", desc = "New Note (Template)" },
      { prefix .. "<space>", "<cmd>Obsidian quick_switch<CR>", desc = "Find Files" },
      { prefix .. "b", "<cmd>Obsidian backlinks<CR>", desc = "Backlinks" },
      { prefix .. "t", "<cmd>Obsidian tags<CR>", desc = "Tags" },
      { prefix .. "T", "<cmd>Obsidian template<CR>", desc = "Template" },
      { prefix .. "L", "<cmd>Obsidian link<CR>", mode = "v", desc = "Link" },
      { prefix .. "l", "<cmd>Obsidian links<CR>", desc = "Links" },
      { prefix .. "l", "<cmd>Obsidian link_new<CR>", mode = "v", desc = "New Link" },
      { prefix .. "e", "<cmd>Obsidian extract_note<CR>", mode = "v", desc = "Extract Note" },
      { prefix .. "w", "<cmd>Obsidian workspace<CR>", desc = "Workspace" },
      { prefix .. "r", "<cmd>Obsidian rename<CR>", desc = "Rename" },
      { prefix .. "i", "<cmd>Obsidian paste_img<CR>", desc = "Paste Image" },
      { prefix .. "d", "<cmd>Obsidian dailies<CR>", desc = "Daily Notes" },
    },
    opts = {
      workspaces = {
        {
          name = "personal-brain",
          path = "~/documents/obsidian/personal-brain/vault",
        },
      },

      notes_subdir = "01 - Bandeja Entrada",

      daily_notes = {
        folder = "03 - Diario/Diariamente",
        date_format = "%Y-%m-%d",
        alias_format = "%B %-d, %Y",
        template = "00 - Data/Plantillas/Diariamente.md",
      },

      completion = {
        nvim_cmp = false,
        blink = true,
      },

      create_new = false,

      picker = {
        name = "snacks.pick",
        note_mappings = {
          -- Create a new note from your query.
          new = "<C-x>",
          -- Insert a link to the selected note.
          insert_link = "<C-l>",
        },
        tag_mappings = {
          -- Add tag(s) to current note.
          tag_note = "<C-x>",
          -- Insert a tag at the current location.
          insert_tag = "<C-l>",
        },
      },

      new_notes_location = "notes_subdir",

      templates = {
        subdir = "00 - Data/Plantillas",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
      },

      ---@param spec { id: string, dir: obsidian.Path, title: string|? }
      ---@return string|obsidian.Path The full path to the new note.
      note_path_func = function(spec)
        return spec.title
      end,

      note_frontmatter_func = function(note)
        if note.title then
          note:add_alias(note.title)
        end

        local out = { aliases = note.aliases }

        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end

        return out
      end,

      follow_url_func = function(url)
        vim.fn.jobstart({ "xdg-open", url })
      end,

      attachments = {
        img_folder = "00 - Data/Documentos",
      },

      image = {
        resolve = function(path, src)
          if require("obsidian.api").path_is_note(path) then
            return require("obsidian.api").resolve_image_path(src)
          end
        end,
      },

      ui = { enable = false },

      statusline = {
        enabled = true,
        format = "{{backlinks}} backlinks | {{words}} words",
      },
    },
  },
  {
    "folke/snacks.nvim",
    keys = {
      {
        prefix .. "k",
        function()
          Snacks.picker.grep({
            search = "^\\s*- \\[ \\]",
            regex = true,
            dirs = { vim.fn.getcwd() },
            finder = "grep",
            format = "file",
            show_empty = true,
            supports_live = false,
            live = false,
          })
        end,
        desc = "Tasks (Unfinished)",
      },
      {
        prefix .. "K",
        function()
          Snacks.picker.grep({
            search = "^\\s*- \\[x\\]:",
            regex = true,
            dirs = { vim.fn.getcwd() },
            finder = "grep",
            format = "file",
            show_empty = true,
            supports_live = false,
            live = false,
          })
        end,
        desc = "Tasks (Finished)",
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { prefix, group = "obsidian", icon = " ", mode = { "n", "v" } },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, 1, "g:obsidian")
    end,
  },
}
