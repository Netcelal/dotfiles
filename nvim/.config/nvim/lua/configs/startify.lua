-- Set vim as local variable for lua diagnostics
local vim = vim

-- Startify config
vim.api.nvim_exec(
  [[
" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

  let g:startify_session_dir = '~/.config/nvim/session'

let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']                     },
      \ { 'type': 'files',     'header': ['   Files']                        },
      \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
      \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
      \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

let g:startify_bookmarks = [
      \ { 'sc': '~/Projects/scratch-pad/scratch1.txt' },
      \ { 'p': '~/Projects' },
      \ { 'al': '~/dotfiles/alacritty/.config/alacritty/alacritty.yml' },
      \ { 'n': '~/dotfiles/nvim/.config/nvim/init.lua' },
      \ { 't': '~/dotfiles/tmux/.tmux.conf' },
      \ { 'z': '~/dotfiles/' },
      \ ]

let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0
let g:webdevicons_enable_startify = 1
nnoremap <leader>st :Startify<CR>
]],
  true
)
