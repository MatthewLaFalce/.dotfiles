syntax on
set nocompatible              
filetype off                  
set number
set splitbelow
set splitright
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-rails'
Plugin 'itchyny/lightline.vim'
"Plugin 'scrooloose/nerdtree'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'

call vundle#end()           


filetype plugin indent on
"Put your non-Plugin stuff after this line
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

"Default color scheme"
set background=dark
let g:solarized_termcolors=256
colorscheme gruvbox
set termguicolors
set cursorline

" air-line
"let g:airline_theme='luna'
"let g:airline_powerline_fonts = 1

"show existing tab with 2 spaces width "
set tabstop=2
"when indenting with '>', use 2 spaces width " 
set shiftwidth=2
"Change tabs to spaces "
set expandtab
set smartindent
"Disable swap file"
set noswapfile

"Keep at least 3 lines above/below"
set scrolloff=3
set lazyredraw

"Show immediately where the so-far typed pattern matches."
set incsearch

"Highlight search term"
set hlsearch

"Always show the status of the file"
set laststatus=2

"jk is escape"
inoremap jk <esc>




