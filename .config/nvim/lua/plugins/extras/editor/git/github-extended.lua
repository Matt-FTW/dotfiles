local prefix = "<leader>G"

return {
  { import = "lazyvim.plugins.extras.util.octo" },
  { import = "plugins.extras.lang.git-extended" },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "gh" })
    end,
  },
  {
    "almo7aya/openingh.nvim",
    cmd = { "OpenInGHRepo", "OpenInGHFile", "OpenInGHFileLines" },
    keys = {
      { prefix .. "ro", "<cmd>OpenInGHRepo<CR>", desc = "Open git repo in web", mode = { "n" } },
      { prefix .. "rf", "<cmd>OpenInGHFile<CR>", desc = "Open git file in web", mode = { "n" } },
      { prefix .. "rc", "<cmd>OpenInGHFileLines<CR>", desc = "Open current line in web", mode = { "n", "x", "v" } },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { prefix, group = "github", icon = " " },
        { prefix .. "c", group = "comments" },
        { prefix .. "t", group = "threads" },
        { prefix .. "i", group = "issues" },
        { prefix .. "p", group = "pull requests" },
        { prefix .. "pm", group = "merge current PR" },
        { prefix .. "r", group = "repo" },
        { prefix .. "a", group = "assignee/reviewer" },
        { prefix .. "l", group = "label" },
        { prefix .. "e", group = "reaction" },
        { prefix .. "R", group = "review" },
        { prefix .. "g", group = "gist" },
        { prefix .. "s", group = "review" },
        { prefix .. "P", group = "profile" },
      },
    },
  },
  {
    "Rawnly/gist.nvim",
    cmd = { "GistCreate", "GistCreateFromFile", "GistsList" },
    dependencies = {
      "samjwill/nvim-unception",
      init = function()
        vim.g.unception_block_while_host_edits = true
      end,
    },
    opts = {},
    keys = {
      { prefix .. "gc", "<cmd>GistCreate<CR>", desc = "Create a Gist" },
      { prefix .. "gf", "<cmd>GistCreateFromFile<CR>", desc = "Create a Gist from File" },
      { prefix .. "gl", "<cmd>GistsList<CR>", desc = "List Gists" },
    },
  },
  {
    "pwntester/octo.nvim",
    opts = {
      use_diagnostic_signs = true,
      mappings = {},
    },
    keys = {
      -- Disable default LazyVim keymaps
      { "<leader>gi", false },
      { "<leader>gI", false },
      { "<leader>gp", false },
      { "<leader>gP", false },
      { "<leader>gr", false },
      { "<leader>gS", false },

      { prefix .. "ca", "<cmd>Octo comment add<CR>", desc = "Add a New Comment" },
      { prefix .. "cd", "<cmd>Octo comment delete<CR>", desc = "Delete a Comment" },

      { prefix .. "ta", "<cmd>Octo thread resolve<CR>", desc = "Mark Thread as Resolved" },
      { prefix .. "td", "<cmd>Octo thread unresolve<CR>", desc = "Mark Thread as Unresolved" },

      { prefix .. "ic", "<cmd>Octo issue close<CR>", desc = "Close Current Issue" },
      { prefix .. "ir", "<cmd>Octo issue reopen<CR>", desc = "Reopen Current Issue" },
      { prefix .. "il", "<cmd>Octo issue list<CR>", desc = "List Open Issues" },
      { prefix .. "is", "<cmd>Octo issue search<CR>", desc = "Search Issues" },
      { prefix .. "iu", "<cmd>Octo issue url<CR>", desc = "Copies URL of Current Issue" },
      { prefix .. "io", "<cmd>Octo issue browser<CR>", desc = "Open Current Issue in Browser" },

      { prefix .. "pp", "<cmd>Octo pr checkout<CR>", desc = "Checkout PR" },
      { prefix .. "pmm", "<cmd>Octo pr merge commit<CR>", desc = "Merge Commit PR" },
      { prefix .. "pms", "<cmd>Octo pr merge squash<CR>", desc = "Squash Merge PR" },
      { prefix .. "pmd", "<cmd>Octo pr merge delete<CR>", desc = "Delete Merge PR" },
      { prefix .. "pmr", "<cmd>Octo pr merge rebase<CR>", desc = "Rebase Merge PR" },
      { prefix .. "pc", "<cmd>Octo pr close<CR>", desc = "Close Current PR" },
      { prefix .. "pn", "<cmd>Octo pr create<CR>", desc = "Create PR for Current Branch" },
      { prefix .. "pd", "<cmd>Octo pr diff<CR>", desc = "Show PR Diff" },
      { prefix .. "ps", "<cmd>Octo pr search<CR>", desc = "Search PR" },
      { prefix .. "ps", "<cmd>Octo pr list<CR>", desc = "List Open PRs" },
      { prefix .. "pr", "<cmd>Octo pr ready<CR>", desc = "Mark Draft as Ready for Review" },
      { prefix .. "po", "<cmd>Octo pr browser<CR>", desc = "Open Current PR in Browser" },
      { prefix .. "pu", "<cmd>Octo pr url<CR>", desc = "Copies URL of Current PR" },
      { prefix .. "pt", "<cmd>Octo pr commits<CR>", desc = "List PR Commits" },
      { prefix .. "pl", "<cmd>Octo pr commits<CR>", desc = "List Changed Files in PR" },

      { prefix .. "rf", "<cmd>Octo repo fork<CR>", desc = "Fork Repo" },
      { prefix .. "ru", "<cmd>Octo repo url<CR>", desc = "Copies URL of Current Repo" },

      { prefix .. "aa", "<cmd> Octo assignee add<CR>", desc = "Assign a User" },
      { prefix .. "ar", "<cmd> Octo assignee remove<CR>", desc = "Remove a User" },
      { prefix .. "ap", "<cmd> Octo reviewer add<CR>", desc = "Assign a PR Reviewer" },

      { prefix .. "la", "<cmd> Octo label add<CR>", desc = "Assign a Label" },
      { prefix .. "lr", "<cmd> Octo label remove<CR>", desc = "Remove a Label" },
      { prefix .. "lc", "<cmd> Octo label create<CR>", desc = "Create a Label" },

      { prefix .. "e1", "<cmd>Octo reaction thumbs_up<CR>", desc = "Add 👍 Reaction" },
      { prefix .. "e2", "<cmd>Octo reaction thumbs_down<CR>", desc = "Add 👎 Reaction" },
      { prefix .. "e3", "<cmd>Octo reaction eyes<CR>", desc = "Add 👀 Reaction" },
      { prefix .. "e4", "<cmd>Octo reaction laugh<CR>", desc = "Add 😄 Reaction" },
      { prefix .. "e5", "<cmd>Octo reaction confused<CR>", desc = "Add 😕 Reaction" },
      { prefix .. "e6", "<cmd>Octo reaction rocket<CR>", desc = "Add 🚀 Reaction" },
      { prefix .. "e7", "<cmd>Octo reaction heart<CR>", desc = "Add ❤️ Reaction" },
      { prefix .. "e8", "<cmd>Octo reaction party<CR>", desc = "Add 🎉 Reaction" },

      { prefix .. "x", "<cmd>Octo actions<CR>", desc = "Run an Action" },

      { prefix .. "ss", "<cmd> Octo review start<CR>", desc = "Start Review" },
      { prefix .. "sf", "<cmd> Octo review submit<CR>", desc = "Submit Review" },
      { prefix .. "sr", "<cmd> Octo review resume<CR>", desc = "Submit Resume" },
      { prefix .. "sd", "<cmd> Octo review discard<CR>", desc = "Delete Pending Review" },
      { prefix .. "sc", "<cmd> Octo review comments<CR>", desc = "View Pending Comments" },
      { prefix .. "sp", "<cmd> Octo review commit<CR>", desc = "Select Commit to Review" },
      { prefix .. "sc", "<cmd> Octo review close<CR>", desc = "Return to PR" },
    },
  },
  {
    "2kabhishek/octohub.nvim",
    dependencies = {
      "2kabhishek/utils.nvim",
    },
    cmd = {
      "OctoRepos",
      "OctoRepo",
      "OctoStats",
      "OctoActivityStats",
      "OctoContributionStats",
      "OctoRepoStats",
      "OctoProfile",
      "OctoRepoWeb",
    },
    opts = {
      add_default_keybindings = false,
      projects_dir = "~/dev/",
    },
    keys = {
      { prefix .. "rl", "<cmd>OctoRepos<CR>", desc = "List Repos" },
      { prefix .. "rS", "<cmd>OctoRepos sort:stars<CR>", desc = "Top Starred Repos" },
      { prefix .. "rI", "<cmd>OctoRepos sort:issues<CR>", desc = "Top Repos With Issues" },
      { prefix .. "rU", "<cmd>OctoRepos sort:updated<CR>", desc = "Recently Updated Repos" },
      { prefix .. "rP", "<cmd>OctoRepos type:private<CR>", desc = "Private Repos" },
      { prefix .. "rF", "<cmd>OctoRepos type:fork<CR>", desc = "Forked Repos" },
      { prefix .. "rc", "<cmd>OctoRepo<CR>", desc = "Clone/Open Repo" },
      { prefix .. "rs", "<cmd>OctoRepoStats<CR>", desc = "Repo Stats" },

      { prefix .. "Ps", "<cmd>OctoStats<CR>", desc = "All Stats" },
      { prefix .. "Pa", "<cmd>OctoActivityStats<CR>", desc = "Activity Stats" },
      { prefix .. "Pc", "<cmd>OctoContributionStats<CR>", desc = "Contribution Stats" },
      { prefix .. "Po", "<cmd>OctoProfile<CR>", desc = "Open Profile" },
    },
  },
}
