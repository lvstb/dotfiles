
" Example config in Vim-Scriptj
"let g:nord_contrast = v:true
""let g:nord_borders = v:false
""let g:nord_disable_background = v:true
"let g:nord_italic = v:false
"let g:indent_blankline_show_trailing_blankline_indent = v:false

" syntax on
set termguicolors
" colorscheme nord

"source $HOME/.config/nvim/config/general.vimrc
"source $HOME/.config/nvim/config/init.vimrc
"source $HOME/.config/nvim/config/plugins.vimrc
source $HOME/.config/nvim/config/keymaps.vimrc
"source $HOME/.config/nvim/config/line.vimrc

"Include lua config
:lua require'init'
