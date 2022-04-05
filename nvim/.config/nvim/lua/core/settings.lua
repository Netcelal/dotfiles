-- Set vim as local variable for lua diagnostics
local vim = vim

-- Settings
-- Create local variable to shorten keymapping commands
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- ===== Settings =====

-- Swap files and backups
-- set folder
vim.cmd [[
set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//
]]
-- set swapfiles and backups
vim.o.backup = false
vim.o.swapfile = false
vim.o.undofile = true

-- Use system clipboard on copy/paste
vim.o.clipboard = "unnamedplus"

-- Indentation settings
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true

-- Completion
vim.o.wildmode = "longest:list,full"
--Incremental live completion (note: this is now a default on master)
vim.o.inccommand = "nosplit"

--Set highlight on search
vim.o.hlsearch = true

--Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

--Do not save when switching buffers (note: this is now a default on master)
vim.o.hidden = true

--Enable mouse mode
vim.o.mouse = "a"

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Optik for cursor
vim.o.ruler = true
vim.o.cursorline = true
vim.o.colorcolumn = "120"

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"
vim.o.timeoutlen = 500

-- Split in a natural way
vim.o.splitright = true
vim.o.splitbelow = true

-- Remove vim modes from below status line
vim.o.showmode = false

-- Minimum space on bottom/top of the window
vim.wo.scrolloff = 5

-- Always show statusbar
vim.o.laststatus = 2

--Set colorscheme (order is important here)
vim.o.termguicolors = true
vim.g.onedark_terminal_italics = 2
vim.g.material_style = "palenight" -- "darker" | "oceanic" | "palenight" | "deep ocean"
vim.g.ayucolor = "mirage"
vim.g.tokyonight_style = "storm" -- "light" | "day" | "storm"
-- On Neovim color theme change, change alacritty color theme too: npx alacritty-themes
vim.cmd [[colorscheme catppuccin]] -- onedark | tokyonight | ayu | material | dracula | catppuccin
