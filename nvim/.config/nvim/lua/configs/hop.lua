-- Hop config
local hop = require "hop"
hop.setup()

-- Hop Keymappings
vim.api.nvim_set_keymap("n", "<leader><leader>/", ":HopPattern<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader><leader>j", ":HopLine<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader><leader>k", ":HopLine<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader><leader>l", ":HopLine<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader><leader>w", ":HopWord<CR>", {noremap = true, silent = true})

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
