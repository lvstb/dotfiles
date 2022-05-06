"Autocommands still work better in vimscript for now

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

"Set Cloudformation filetype and keep the yaml syntax
au BufRead,BufNewFile *cf*.{yaml,yml} set filetype=yaml.cloudformation


""Cloudformation filetype
" autocmd BufRead,BufNewFile *cf*.{yaml,yml} call SetCloudFormationOptions()
"function SetCloudFormationOptions()
"    setl nowrap
"    set ft=cloudformation
"    set syntax=yaml
"    set tabstop=2
"    set expandtab
"    set shiftwidth=2
"    set softtabstop=2
"    set foldmethod=indent
"    set foldlevel=99
"    set commentstring=#\ %s
"endfunction
"
autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
