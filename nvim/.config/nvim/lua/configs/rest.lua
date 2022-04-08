-- Set vim as local variable for lua diagnostics
local vim = vim

-- ToDo Comments config {{{
require("todo-comments").setup {}
-- }}}

-- Comment config {{{
require("Comment").setup()
-- }}}

-- Neosroll config {{{
require("neoscroll").setup()
-- }}}

-- Highlight on yank {{{
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]
-- }}}

-- Trouble config {{{
-- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists to help you solve all the trouble your code is causing.
-- map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", {silent = true, noremap = true})
-- map("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", {silent = true, noremap = true})
-- map("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>", {silent = true, noremap = true})
-- map("n", "<leader>xl", "<cmd>Trouble loclist<cr>", {silent = true, noremap = true})
-- map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", {silent = true, noremap = true})
-- map("n", "gR", "<cmd>Trouble lsp_references<cr>", {silent = true, noremap = true})
-- }}}

-- Impatient config {{{
require("impatient").enable_profile()
-- }}}

-- Blamer config {{{
vim.cmd [[
let g:blamer_enabled = 1
let g:blamer_delay = 500
]]
-- }}}
