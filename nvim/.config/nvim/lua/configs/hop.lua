-- Create local variable to shorten keymapping commands
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- Hop config
local hop = require "hop"
hop.setup()

-- Hop Keymappings
map("n", "<leader><leader>/", ":HopPattern<CR>", {silent = true})
map("n", "<leader><leader>j", ":HopLine<CR>", {silent = true})
map("n", "<leader><leader>k", ":HopLine<CR>", {silent = true})
map("n", "<leader><leader>l", ":HopLine<CR>", {silent = true})
map("n", "<leader><leader>w", ":HopWord<CR>", {silent = true})

-- Hop Color Config
vim.cmd [[
" Highlight used for the mono-sequence keys (i.e. sequence of 1).
highlight default HopNextKey  guifg=#fc4903 gui=bold ctermfg=198 cterm=bold

" Highlight used for the first key in a sequence.
highlight default HopNextKey1 guifg=#fc4903 gui=bold ctermfg=45 cterm=bold

" Highlight used for the second and remaining keys in a sequence.
highlight default HopNextKey2 guifg=#fc4903 ctermfg=33

" Highlight used for the unmatched part of the buffer.
highlight default HopUnmatched guifg=#666666 ctermfg=242
]]
