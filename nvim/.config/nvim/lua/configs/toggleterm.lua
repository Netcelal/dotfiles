-- Set vim as local variable for lua diagnostics
local vim = vim

-- Create local variable to shorten keymapping commands
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- Toggleterm config
require("toggleterm").setup {
  open_mapping = [[<C-t>]],
  size = 15
}
-- Toggleterm keybindings
function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  map("t", "<C-t>", [[<C-\><C-n>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal
local lazygit =
  Terminal:new(
  {
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
      border = "double"
    },
    -- function to run on opening the terminal
    on_open = function(term)
      -- vim.cmd("startinsert!")
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
    end
    -- function to run on closing the terminal
    -- on_close = function(term)
    --   vim.cmd("Closing terminal")
    -- end
  }
)

function _lazygit_toggle()
  lazygit:toggle()
end

map("n", "<C-gl>", "<cmd>lua _lazygit_toggle()<CR>", opts)
