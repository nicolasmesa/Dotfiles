call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'elzr/vim-json', { 'for': 'json' }
"Plug 'godlygeek/tabular'
Plug 'gregsexton/MatchTag', { 'for': 'html' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'gabrielelana/vim-markdown'
Plug 'junegunn/goyo.vim'

" Search
Plug 'ctrlpvim/ctrlp.vim'

" Icons
"Plug 'ynoasis/vim-devicons'


Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin'


call plug#end()
