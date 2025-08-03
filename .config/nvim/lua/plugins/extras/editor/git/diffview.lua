local prefix_conflicts = "<leader>gc"
local prefix_diffs = "<leader>gd"

local function toggle_diffview(cmd)
  if next(require("diffview.lib").views) == nil then
    vim.cmd(cmd)
  else
    vim.cmd("DiffviewClose")
  end
end

return {
  {
    "sindrets/diffview.nvim",
    -- stylua: ignore
    keys = {
      { prefix_diffs .. "D", function() toggle_diffview("DiffviewFileHistory") end, desc = "Diff Repo" },
      { prefix_diffs .. "d", function() toggle_diffview("DiffviewOpen") end, desc = "Diff View" },
      { prefix_diffs .. "f", function() toggle_diffview("DiffviewFileHistory %") end, desc = "Diff Current File History" },
    },
    opts = function(_, opts)
      local actions = require("diffview.actions")

      opts.enhanced_diff_hl = true
      opts.view = {
        default = { winbar_info = true },
        file_history = { winbar_info = true },
      }
      opts.hooks = {
        diff_buf_read = function(bufnr)
          vim.b[bufnr].view_activated = false
        end,
      }

      opts.keymaps = {
        --stylua: ignore
        view = {
          { "n", prefix_conflicts .. "o",  actions.conflict_choose("ours"),        { desc = "Ours" } },
          { "n", prefix_conflicts .. "t",  actions.conflict_choose("theirs"),      { desc = "Theirs" } },
          { "n", prefix_conflicts .. "b",  actions.conflict_choose("base"),        { desc = "Base" } },
          { "n", prefix_conflicts .. "a",  actions.conflict_choose("all"),         { desc = "All" } },
          { "n", prefix_conflicts .. "d",  actions.conflict_choose("none"),        { desc = "Delete" } },
          { "n", prefix_conflicts .. "O",  actions.conflict_choose_all("ours"),    { desc = "Ours (File)" } },
          { "n", prefix_conflicts .. "T",  actions.conflict_choose_all("theirs"),  { desc = "Theirs (File)" } },
          { "n", prefix_conflicts .. "B",  actions.conflict_choose_all("base"),    { desc = "Base (File)" } },
          { "n", prefix_conflicts .. "A",  actions.conflict_choose_all("all"),     { desc = "All (File)" } },
          { "n", prefix_conflicts .. "D",  actions.conflict_choose_all("none"),    { desc = "Delete (File)" } },
        },
        --stylua: ignore
        file_panel = {
          { "n", prefix_conflicts .. "O",  actions.conflict_choose_all("ours"),    { desc = "Ours (File)" } },
          { "n", prefix_conflicts .. "T",  actions.conflict_choose_all("theirs"),  { desc = "Theirs (File)" } },
          { "n", prefix_conflicts .. "B",  actions.conflict_choose_all("base"),    { desc = "Base (File)" } },
          { "n", prefix_conflicts .. "A",  actions.conflict_choose_all("all"),     { desc = "All (File)" } },
          { "n", prefix_conflicts .. "X",  actions.conflict_choose_all("none"),    { desc = "Delete (File)" } },
        },
      }
    end,
  },
  {
    "NeogitOrg/neogit",
    optional = true,
    opts = {
      integrations = {
        diffview = true,
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { prefix_conflicts, group = "conflicts", icon = " " },
        { prefix_diffs, group = "diff", icon = " " },
      },
    },
  },
}
