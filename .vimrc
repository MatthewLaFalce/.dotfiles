syntax on
set nocompatible              
filetype off                  
set number
set splitbelow
set splitright
set cursorline

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
Plug 'sheerun/vim-wombat-scheme'
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

"Sysntastically
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_enable_balloons = 1

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
map <F6> :%!python -m json.tool<CR>
map <F7> gg=G<C-o><C-o>

let os = substitute(system('uname'), '\n', '', '')
if os == "Linux"
  if !has('gui_running')
    set t_Co=256
  endif
  colorscheme wombat
  "Signify
  highlight SignColumn ctermbg=NONE cterm=NONE guibg=NONE gui=NONE
  " highlight lines in Sy and vimdiff etc.)
  highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
  highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
  highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
  " highlight signs in Sy
  highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
  highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
  highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227
elseif os == "Darwin"
  set background=dark
  let g:solarized_termcolors=256
  colorscheme gruvbox
  set termguicolors
end


