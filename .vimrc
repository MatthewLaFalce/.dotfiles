syntax on
set nocompatible              
filetype off                  
set number
set splitbelow
set splitright

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'mhinz/vim-signify'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'morhetz/gruvbox'
call plug#end()

filetype plugin indent on
"Put your non-Plugin stuff after this line
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

"Default color scheme"
set background=dark
let g:solarized_termcolors=256
colorscheme gruvbox
set termguicolors
set cursorline

"Sysntastically
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Tab Settings
set tabstop=2 "show existing tab with 2 spaces width "
set shiftwidth=2 "when indenting with '>', use 2 spaces width " 
set expandtab "Change tabs to spaces "
set smartindent

"Disable swap file"
set noswapfile

"Keep at least 3 lines above/below"
set scrolloff=3
set lazyredraw

"Search Settings
set incsearch "Show immediately where the so-far typed pattern matches."
set hlsearch "Highlight search term"

"Always show the status of the file"
set laststatus=2

"jk is escape"
inoremap jk <esc>
map <silent> <C-n> :NERDTreeToggle<CR>
map <F5> :setlocal spell! spelllang=en_us<CR>
map <F7> gg=G<C-o><C-o>


