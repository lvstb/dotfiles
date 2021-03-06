"        _
"  _  __(_)_ _  ________
" | |/ / /  ' \/ __/ __/
" |___/_/_/_/_/_/  \__/

" Options {{{
filetype plugin indent on

set timeout timeoutlen=500 ttimeoutlen=100
" Vim autocomplete options
set completeopt=menuone
set hidden                " hide buffers instead of closing them
" set showtabline=2
set laststatus=2          " Always display the statusline in all windows
set backspace=2           " Backspace deletes like most programs in insert mode
set encoding=utf8         " Sets charachter encoding
"set mouse=                " Disabling mouse support
set history=1000          " Remember ALL THE commands!
set undolevels=1000       " Do ALL THE undo's!
set undoreload=10000      " Maximum number lines to save for undo on a buffer reload
set virtualedit=onemore   " Allow for cursor beyond last character
set tabstop=4             " Number of spaces for a tab
set softtabstop=4         " Number of spaces for a tab while editing
set shiftwidth=4          " Shift width value
set t_BE=                 " fixes bracketed paste mode
set shiftround            " Round the shift indent
set expandtab             " Conver tabs to spaces
set lazyredraw            " Terminal performance optimisation
set magic                 " Better searching
set noswapfile            " Don't pollute my hard drive, even temporary
set wrap                  " Wrap long lines
set smartindent           " Auto indent when starting a new line
set relativenumber        " Use relative line numbers
set showmatch             " Show matching brackets (Damn this is so cool!)
set ignorecase            " Case insensitive search
set smartcase             " Case sensitive when uc present
set cursorline            " Highlight cursorline!
set ruler                 " Always show current position
set list                  " Show specials charcters like tabs (^I), end of line ($), ...
set listchars=tab:\│\ ,trail:-,extends:>,precedes:<,nbsp:+
set splitbelow            " Split current window below
set splitright            " Split current window right
set showcmd               " Display incomplete commands
set autowrite             " Automatically :write before running commands
set number                " Show line numbers
set numberwidth=5         " Line number reserved space
set autochdir             " Change the current dir if you open a file
set modelines=1           " Disable modeline support
set guioptions=TlrLR      " Options when running vim in GUI mode
set cpoptions+=$          " Show a $ sign in the change buffer
set updatetime=250        " Update time for diff markers
set hlsearch
set incsearch
set wildignore+=*/.git/*,*/tmp/*,*.swp
"set t_Co=256              " Number of colors
set spellfile=$HOME/.vim-spell-en.utf-8.add "Word list file
match ErrorMsg '\s\+$'

" }}}
" Backup {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}
" Plugins {{{
call plug#begin()
Plug 'Shougo/neocomplete.vim'
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
"Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'elzr/vim-json'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'https://github.com/m-kat/aws-vim'
Plug 'tpope/vim-fugitive'
Plug 'hashivim/vim-terraform'
Plug 'pearofducks/ansible-vim'
" Plug 'bling/vim-bufferline'
Plug 'ap/vim-buftabline'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'alecthomas/gometalinter'
" Color schemes
Plug 'chriskempson/base16-vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
call plug#end()
" }}}
" }}}
" ALE {{{
let g:ale_linter_aliases = {'yaml': ['cloudformation', 'yaml']}
" Check Python files with flake8 and pylint.
let g:ale_linters = {
                \   'python': ['flake8', 'black', 'isort', 'mypy', 'prospector', 'pyls', 'pycodestyle'],
                \   'cfn_yaml': ['cfn_python_lint'],
                \   }
" Fix Python files with autopep8 and yapf.
let g:ale_fixers = ['autopep8', 'yapf']
let g:ale_open_list = 'on_save'
" }}}
" NERDTree {{{
let NERDTreeChDirMode=2     " Display the current working directory
let NERDTreeShowBookmarks=1 " Show Bookmarks on startup
"let NERDTreeShowHidden=1   " Show hidden files on startup
" }}}
" CtrlP {{{
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_open_new_file = 'v'
"let g:ctrlp_by_filename = 1
" let g:ctrlp_custom_ignore = {'dir': 'dist'}
" Setup some default ignores
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
"   \ 'file': '\v\.(exe|so|dll)$',
"   \}
" Use the nearest .git directory as the cwd
let g:ctrlp_working_path_mode = 'r'
" }}}
" Neocomplete {{{
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" " Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" " Use smartcase.
let g:neocomplete#enable_smart_case = 1
" " Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" AutoComplPop like behavior.
" let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" }}}
" Airline {{{
"
"let g:airline_theme                       = 'nord'
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#ale#enabled = 1
"%{ALEGetStatusLine()}
"let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
"}}}
" Leader shortcuts {{{

" Check a key binding, ex: verbose nmap <Leader>r

let mapleader = ","
let maplocalleader = ","

nnoremap <Leader><Leader> V|                      " Select viual line
nnoremap <Leader>a :bprev<CR>|                    " Open the previous buffer
nnoremap <Leader>b :CtrlPBuffer<CR>|              " CTRLP find buffer mode
nnoremap <Leader>bm :CtrlPMixed<CR>|              " CTRLP find files, buffers and MRU files
nnoremap <Leader>bs :CtrlPMRU<CR>|                " CTRLP find MRU files
vnoremap <Leader>c :w !pbcopy<CR><CR>|            " Copy to clipboard
nnoremap <Leader>d :bd<CR>|                       " delete the current buffer
nnoremap <Leader>ev :vsp $MYVIMRC<cr>|            " Open up .vimrc quickly in a new buffer
nnoremap <Leader>gg :Goyo<CR>|                    " Switch to Goyo
nnoremap <Leader>m :VimuxRunCommand<CR>|          " Start vimux
nnoremap <Leader>p :CtrlP<CR>|                    " CTRLP find files
nnoremap <Leader>v :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
inoremap <Leader>v <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
nnoremap <leader>rs :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>| " Remove trailing whitespaces
nnoremap <Leader>s :bnext<CR>|                    " Open the next buffer
nnoremap <Leader>sv :source $MYVIMRC<cr>|         " Source .vimrc explicitly
nnoremap <Leader>tt :TagbarToggle<CR>|            " Toggle Tagbar
nnoremap <Leader>vp :VimuxPromptCommand<CR>|      " Prompt for a command to run
nnoremap <Leader>vl :VimuxRunLastCommand<CR>      " Run last command executed by VimuxRunCommand
nnoremap <Leader>vi :VimuxInspectRunner<CR>|      " Inspect runner pane
nnoremap <Leader>vq :VimuxCloseRunner<CR>|        " Close vim tmux runner opened by VimuxRunCommand
nnoremap <Leader>vx :VimuxInterruptRunner<CR>|    " Interrupt any command running in the runner pane
nnoremap <Leader>vz :call VimuxZoomRunner()<CR>|  " Zoom the runner pane (use <bind-key> z to restore runner pane)
nnoremap <Leader>w :w<CR>|                        " Save buffer
nnoremap <Leader>ms :MarkdownPreview<CR>|        " Start MarkdownPreview
nnoremap <Leader>mx :MarkdownPreviewStop<CR>|        " Stop MarkdownPreview
nnoremap <Leader>f :Files<CR>|                    " fzf search all files
nnoremap <Leader>g :GFiles<CR>|                   " fzf search for git tracked files
nnoremap <Leader>h :History<CR>|

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" }}}
" Shortcuts {{{

"Disable the mouse wheel
inoremap <ScrollWheelUp> <Nop>
inoremap <ScrollWheelDown> <Nop>

nmap <S-Enter> Ojj
nmap <CR> ojj
" NERDTree
map <F2> :NERDTreeToggle<CR>
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
" Tagbar config
"let g:tagbar_ctags_bin = '/usr/bin/ctags'"
" Ex-mode is shitty
nnoremap  Q <nop>
" Move single row on wrapped lines
nmap j gj
nmap k gk
" Folding
nnoremap <Space> za
vnoremap <Space> za
" Use vim way instead
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" Disabling arrow keys in normal and insert mode
"nnoremap  <up> <nop>
"nnoremap  <down> <nop>
"nnoremap  <left> <nop>
"nnoremap  <right> <nop>
"inoremap  <up> <nop>
"inoremap  <down> <nop>
"inoremap  <left> <nop>
"inoremap  <right> <nop>
" Disable arrow keys in command mode
"cnoremap <Up> <nop>
"cnoremap <Down> <nop>
" Disabling escape key. It's too far away!
inoremap  <esc> <nop>
" `jj` is much better :)
inoremap  jj <esc>
inoremap  jk <esc>
" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <buffer> rp :exec '!python' shellescape(@%, 1)<cr>

noremap pp :ALEFix<CR>
" }}}
" ripgrep {{{
if executable('rg')
" Use ripgrep: https://github.com/BurntSushi/ripgrep
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif
" }}}
" vim-go {{{
if executable('rg')
  let g:go_metalinter_autosave = 1
  let g:go_fmt_command = "goimports"
  " let g:go_fmt_command = "gofmt"
  " let g:go_fmt_options = "-s"
endif
" }}}
" Gitgutter {{{
set signcolumn=yes
let g:gitgutter_sign_modified = '»'
" }}}

" Colors {{{
syntax on
let base16colorspace=256
let g:rehash256 = 1
colorscheme nord
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
let g:nord_comment_brightness = 15
let g:nord_cursor_line_number_background = 1

highlight Comment cterm=italic
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
"set termguicolors
highlight ErrorMsg guibg=White guifg=Red
highlight LineNr guifg=#b3b3b3
" Assure the tabline color is black
highlight TabLineFill term=bold cterm=bold ctermbg=0
"}}}

"filetype specific stuff
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" CloudFormation filetype config
autocmd BufRead,BufNewFile cfn-*.yaml,cfn-*.yml call SetCloudFormationOptions()
function SetCloudFormationOptions()
    setl nowrap
    set ft=cloudformation
    set syntax=yaml
    set tabstop=2
    set expandtab
    set shiftwidth=2
    set softtabstop=2
    set foldmethod=indent
    set foldlevel=99
    set commentstring=#\ %s
endfunction


" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

au! BufNewFile,BufReadPost *.{cnf,cf} set filetype=cloudformation

au BufEnter * call MyLastWindow()
function! MyLastWindow()
  " if the window is quickfix go on
  if &buftype=="quickfix"
    " if this window is last on screen quit without warning
    if winbufnr(2) == -1
      quit!
    endif
  endif
endfunction

" Markdown editor stuff
 " preview page title
 " ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'
let g:mkdp_auto_start = 0

source ~/.config/statusline.vim



" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)


command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

