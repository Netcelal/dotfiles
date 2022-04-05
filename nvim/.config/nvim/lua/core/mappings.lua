-- Set vim as local variable for lua diagnostics
local vim = vim

-- Create local variable to shorten keymapping commands
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- Mappings

--Remap space as leader key
-- map("n", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Fast escape from insert mode
map("i", "jk", "<Esc>", opts)
map("n", "<CR>", "<cmd>nohl<CR>", opts)

--Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", {noremap = true, expr = true, silent = true})
map("n", "j", "v:count == 0 ? 'gj' : 'j'", {noremap = true, expr = true, silent = true})

-- Y yank until the end of line  (note: this is now a default on master)
map("n", "Y", "y$", {noremap = true})

-- -- Enforcing Purity for myself to not use arrow keys
-- map("n", "<UP>", ":resize +2<CR>", opts)
-- map("n", "<Down>", ":resize -2<CR>", opts)
-- map("n", "<Left>", ":vertical resize +2<CR>", opts)
-- map("n", "<Right>", ":vertical resize -2<CR>", opts)

-- -- Terminal
-- map("t", "<Esc>", "<C-\\><C-n>", opts)
-- map("t", "jk", "<C-\\><C-n>", opts)

-- map("n", "<C-\\>", ":sp<bar>term<CR><C-w>J:resize10<CR>", opts)
-- Mappings to move lines
-- https://stackoverflow.com/questions/5379837/is-it-possible-to-mapping-alt-hjkl-in-insert-mode
map("v", "<M-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<M-k>", ":m '<-2<CR>gv=gv", opts)

map("n", "<C-e>", "3<C-e>", opts)
map("n", "<C-y>", "3<C-y>", opts)

-- Use Ctrl+H,J,K,L to navigate panes
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- better indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- better search
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- Tabbing through buffers
map("n", "<Tab>", ":bn<CR>", opts) -- Next buffer in list
map("n", "<S-Tab>", ":bp<CR>", opts) -- Previous buffer in list
map("n", "<leader><Tab>", ":b#<CR>", opts) -- Previous buffer you were in

-- Deletes current buffer
map("n", "<leader>bd", ":b#<bar>bd#<CR>", opts)
