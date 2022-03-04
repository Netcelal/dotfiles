-- Create local variable to shorten keymapping commands
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- NeoGit config
require("neogit").setup(
  {
    -- Change the default way of opening neogit
    kind = "split",
    integrations = {
      diffview = true
    }
  }
)
-- For better git diffs
require("diffview").setup({})

map("n", "<C-g>", ":Neogit kind=split<CR>", opts)
