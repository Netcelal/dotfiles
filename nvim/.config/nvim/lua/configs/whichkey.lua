-- Create local variable to shorten keymapping commands
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- Which Key config
require("which-key").setup {}
local wk = require("which-key")
wk.register(
  {
    f = {
      name = "Telescope File",
      f = "Find File",
      b = "Buffers",
      w = "Live Grep",
      l = "File Browser"
    },
    s = {
      name = "Telescope Buffer",
      b = "Buffer Live Grep",
      h = "Help Tags",
      t = "Tags",
      d = "Grep String"
    },
    ["<leader>st"] = "Startify",
    ["<C-n>"] = "Nvim Tree",
    ["<C-p>"] = "List Projects",
    ["C-t"] = "Open Terminal",
    ["C-g"] = "Open NeoGit",
    ["C-gl"] = "Open LazyGit",
    ["bg"] = "Go to Buffer",
    ["[d"] = "Diagnostics go to previous",
    ["]d"] = "Diagnostics go to next",
    ["<leader>e"] = "Diagnostics open float",
    ["<leader>q"] = "set local list",
    ["gD"] = "go to declaration",
    ["gd"] = "go to definition",
    ["K"] = "hover",
    ["gi"] = "go to implementation",
    ["<C-k>"] = "signature help",
    ["<space>wa"] = "add workspace folder",
    ["<space>wr"] = "remove workspace folder",
    ["<space>wl"] = "list workspace folder",
    ["<space>D"] = "type definition",
    ["<space>rn"] = "rename",
    ["<space>ca"] = "code actions",
    ["gr"] = "go to references",
    ["<space>f"] = "format"
  },
  {prefix = "<leader>"}
)
map("n", "<leader><leader>", ":WhichKey <leader><CR>", opts)
