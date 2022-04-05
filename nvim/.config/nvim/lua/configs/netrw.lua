vim.cmd [[
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15
let g:netrw_keepdir = 0

" Bind '?' to netrw help
autocmd FileType netrw nnoremap ? :help netrw-quickmap<CR>

nnoremap <leader>dd :Lexplore %:p:h<CR>
nnoremap <C-n> :Lexplore<CR>
]]
