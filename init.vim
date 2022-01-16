"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set encoding=utf-8

syntax on
noremap <leader>n :NERDTreeFocus<CR>
map s<up> :res +5<CR>
map s<down> :res -5<CR>
map s<left> :vertical resize-5<CR>
map s<right> :vertical resize+5<CR>

map <space>l <C-w>l
map <space>k <C-w>k
map <space>h <C-w>h
map <space>j <C-w>j

map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

map nt :tabe<CR>
map tn :tabnext<CR>
map tp :-tabnext<CR>


set number
set relativenumber
set cursorline
set wrap
set wildmenu

call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
colorscheme gruvbox



