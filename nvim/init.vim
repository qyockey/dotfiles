set exrc
set encoding=UTF-8
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set relativenumber
set nu
set hidden
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set smartcase
set ignorecase
set scrolloff=8
set signcolumn=no
set incsearch
set nohlsearch
set clipboard=unnamedplus

call plug#begin()
Plug 'ap/vim-css-color'
Plug 'ryanoasis/vim-devicons'
" Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-telescope/telescope.nvim'
Plug 'lervag/vimtex'
" Plug 'gruvbox-community/gruvbox'
Plug 'overcache/NeoSolarized'
" Plug 'subnut/nvim-ghost.nvim'
" Plug 'ThePrimeagen/vim-be-good'
Plug 'karb94/neoscroll.nvim'
Plug 'neoclide/coc-java'
" Plug 'neoclide/coc.nvim'
call plug#end()

colorscheme NeoSolarized
set background=dark
hi Normal ctermbg=none

" disable crutches
nmap <Up>    <NOP>
nmap <Down>  <NOP>
nmap <Left>  <NOP>
nmap <Right> <NOP>

imap <Up>    <NOP>
imap <Down>  <NOP>
imap <Left>  <NOP>
imap <Right> <NOP>

vmap <Up>    <NOP>
vmap <Down>  <NOP>
vmap <Left>  <NOP>
vmap <Right> <NOP>

" better fast navigation bindings
nnoremap H ^
nnoremap L $
nnoremap K {
nnoremap J }

" movement keys in insert mode
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" tabbing
nnoremap <Tab>   >>
nnoremap <S-Tab> <<
vnoremap <Tab>   >><Esc>gv
vnoremap <S-Tab> <<<Esc>gv

" auto open groupings
inoremap ( ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap [ []<Left>
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap { {<CR>}<Left><C-o>O<Tab>
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"

" change Y to fit with C and D
nnoremap Y y$
" set faster esc key bind
inoremap jj <ESC>

" smooth scrolling
lua require('neoscroll').setup()

" coc autocompletion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


syntax enable

" vimtex configs
" This is necessary for VimTeX to load properly. The 'indent' is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this,
" some VimTeX features will not work (see ':help vimtex-requirements' for more
" " info).
syntax enable
"
" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_general_viewer = 'okular'
"
" Or with a generic interface:
"let g:vimtex_view_general_viewer = 'okular'
"let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
"
" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ':help vimtex-compiler'.
let g:vimtex_compiler_method = 'latexmk'
"
" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol '\'.
let maplocalleader = '\'
