return {
  {
    "voldikss/vim-floaterm",
    cmd = { "FloatermNew", "FloatermToggle", "FloatermNext", "FloatermPrev" },
    --stylua: ignore
    keys = {
  { "<leader>cis", "<cmd>FloatermNew --disposable --name=duaroot --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<root> dua i<CR>", desc = "Workspace Size (root dir)" },
  { "<leader>ciS", "<cmd>FloatermNew --disposable --name=duabuffer --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<buffer> dua i<CR>", desc = "Workspace Size (cwd)" },
  { "<A-e>", "<cmd>FloatermNew --disposable --name=yaziroot --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<root> yazi<CR>", desc = "File Explorer (root dir)" },
  { "<leader>gg", "<cmd>FloatermNew --disposable --name=lazygitroot --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<root> lazygit<CR>", desc = "Lazygit (root dir)" },
  { "<leader>gG", "<cmd>FloatermNew --disposable --name=lazygitbuffer --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<buffer> lazygit<CR>", desc = "Lazygit (cwd)" },
  { "<leader>fD", "<cmd>FloatermNew --disposable --name=lazydocker --opener=edit --titleposition=center --height=0.85 --width=0.85 lazydocker<CR>", desc = "Lazydocker" },
  { "<leader>cPp", "<cmd>FloatermNew --disposable --name=lazynpm --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<root> lazynpm<CR>", desc = "Lazynpm" },
  { "<leader>cib", "<cmd>FloatermNew --disposable --name=btop --opener=edit --titleposition=center --height=0.85 --width=0.85 btop<CR>", desc = "Btop" },
  { "<leader>fd", "<cmd>FloatermNew --disposable --name=dots --opener=edit --titleposition=center --height=0.85 --width=0.85 dots<CR>", desc = "Dotfiles" },
  { "<leader>cin", "<cmd>FloatermNew --disposable --name=navi --opener=edit --titleposition=center --height=0.85 --width=0.85 pages<CR>", desc = "Navi Pages" },
  { "<leader>cip", "<cmd>FloatermNew --disposable --name=proc --opener=edit --titleposition=center --height=0.85 --width=0.85 proc<CR>", desc = "Systemd Processes" },
  { "<leader>cic", "<cmd>FloatermNew! --disposable --name=scc --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<root> codeinfo<CR>", desc = "Codefetch" },
  { "<leader>cig", "<cmd>FloatermNew! --disposable --name=onefetch --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<root> gfetch<CR>", desc = "Gitfetch" },
  { "<leader>CT", "<cmd>FloatermNew --name=gpt --opener=edit --titleposition=center --width=0.85 --height=0.85 gpt<CR>", desc = "Terminal GPT" },
  { "<leader>ctn", "<cmd>FloatermNew --name=node --opener=edit --titleposition=center --wintype=split --height=0.35 node<CR>", desc = "Node" },
  { "<leader>ctp", "<cmd>FloatermNew --name=python --opener=edit --titleposition=center --wintype=split --height=0.35 python<CR>", desc = "Python" },
      { "<C-l>", "<Esc><Esc><cmd>FloatermNext<CR>", mode = { "t" }, desc = "Next Terminal" },
      { "<C-h>", "<Esc><Esc><cmd>FloatermPrev<CR>", mode = { "t" }, desc = "Prev Terminal" },
      { "<C-Right>", "<Esc><Esc><cmd>FloatermLast<CR>", mode = { "t" }, desc = "Last Terminal" },
      { "<C-Left>", "<Esc><Esc><cmd>FloatermFirst<CR>", mode = { "t" }, desc = "First Terminal" },
  { "<leader>st", "<cmd>Telescope floaterm<cr>", desc = "Terminals" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>ci"] = { name = "+info" },
        ["<leader>ct"] = { name = "+terminals" },
      },
    },
  },
}
