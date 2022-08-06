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

execute pathogen#infect()

call plug#begin()
Plug 'ap/vim-css-color'
Plug 'ryanoasis/vim-devicons'
"Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'lervag/vimtex'
Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}
Plug 'roxma/nvim-yarp', v:version >= 800 && !has('nvim') ? {} : { 'on': [], 'for': [] }
Plug 'roxma/vim-hug-neovim-rpc', v:version >= 800 && !has('nvim') ? {} : { 'on': [], 'for': [] }
call plug#end()

" disable crutches
nmap <Up>    <NOP>
nmap <Down>  <NOP>
nmap <Left>  <NOP>
nmap <Right> <NOP>
imap <Up>    <NOP>
imap <Down>  <NOP>
imap <Left>  <NOP>
imap <Right> <NOP>

" better fast navigation bindings
nnoremap H ^
nnoremap L $
nnoremap K {
nnoremap J }

" disable awkward keys
nmap ^ <NOP>
nmap $ <NOP>
nmap { <NOP>
nmap } <NOP>

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

" disable awkward keys
nmap >> <NOP>
nmap << <NOP>
vmap >> <NOP>
vmap << <NOP>




" set faster esc key bind
inoremap jj <ESC>

" set solarized dark background
syntax enable
set background=dark
colorscheme solarized

" syntastic config
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0


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
