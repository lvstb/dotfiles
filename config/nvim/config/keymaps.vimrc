let mapleader = ","
let maplocalleader = ","
vnoremap <Leader>c :w !pbcopy<CR><CR>|            " Copy to clipboard
nnoremap <Leader>v :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
"nnoremap <leader>rs :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>| " Remove trailing whitespaces
nnoremap <Leader>h :History<CR>|
" Move single row on wrapped lines
nmap j gj
nmap k gk
" Folding
nnoremap <Space> za
vnoremap <Space> za
" Use vim way instead
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

nnoremap <leader>u :UndotreeShow<CR>
"Disable the mouse wheel
inoremap <ScrollWheelUp> <Nop>
inoremap <ScrollWheelDown> <Nop>

inoremap  <esc> <nop>
" `jj` is much better :)
inoremap  jj <esc>
inoremap  jk <esc>

"  using Telescope command-line sugar.
noremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"Open terminal below window
nnoremap <leader>t :below 10sp term://$SHELL<cr>i

" Highlight yanks
augroup highlight_yanks
  autocmd!
  autocmd TextYankPost * lua vim.highlight.on_yank {
        \ higroup = "Substitute",
        \ timeout = 150,
        \ on_macro = true
        \ }
augroup END

" Remove trailing spaces and lines on write
augroup clean_trailing
  autocmd!
  autocmd BufWritePre * silent! exe "normal! mz"
  autocmd BufWritePre * silent! %s/\s\+$//e
  autocmd BufWritePre * silent! %s/\n\+\%$//e
  autocmd BufWritePre * silent! exe "normal! `z"
augroup END

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid, when inside an event handler
" (happens when dropping a file on gvim) and for a commit message (it's
" likely a different one than last time).
augroup restore_cursor
  autocmd!
  autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' | exe "normal! g`\"" | endif
augroup END
