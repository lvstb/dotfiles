"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set path+=**					" Searches current directory recursively.':find file.py'
" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/.git/*
set wildignore+=*/tmp/*,*.swp

set tabstop=4             " Number of spaces for a tab
set softtabstop=4         " Number of spaces for a tab while editing
set shiftwidth=4          " Shift width value

set hlsearch              "Higlighted searh
set incsearch             "Incremental search
set ignorecase            " Case insensitive search
set smartcase             " Case sensitive when uc present

set timeoutlen=500                      " By default timeoutlen is 1000 ms
set updatetime=250        " Update time for diff markers

set cursorline            " Highlight cursorline!
set list                  " Show specials charcters like tabs (^I), end of line ($), ...
set listchars=tab:\│\ ,trail:-,extends:>,precedes:<,nbsp:+
set splitbelow            " Split current window below
set splitright            " Split current window right
set showcmd               " Display incomplete commands
set autowrite             " Automatically :write before running commands

set number relativenumber       " Display line numbers
set nu rnu                      "Together with relative numbers tis creates a hybrid one

set nobackup
set noswapfile
