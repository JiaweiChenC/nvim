
   
" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: @Jiawei

" Checkout-list
" vim-esearch
" fmoralesc/worldslice
" SidOfc/mkdx

if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set number
set relativenumber
set ruler
set hlsearch
set expandtab
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set ignorecase
set smartcase
set notimeout
set mouse=a
set cursorline
set wrap
set wildmenu
set showcmd
set expandtab
set smarttab

set encoding=utf-8

syntax on
noremap <leader>n :NERDTreeFocus<CR>

" disable the s key
noremap s <nop>
vnoremap Y "+y

noremap J 5j
noremap K 5k
noremap L 5l
noremap H 5h

noremap su :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sd :set splitbelow<CR>:split<CR>
noremap sl :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sr :set splitright<CR>:vsplit<CR>

map s<up> :res +5<CR>
map s<down> :res -5<CR>
map s<left> :vertical resize-5<CR>
map s<right> :vertical resize+5<CR>

map <space>l <C-w>l
map <space>k <C-w>k
map <space>h <C-w>h
map <space>j <C-w>j

" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H


map nt :tabe<CR>
map tn :tabnext<CR>
map tp :-tabnext<CR>

noremap tmn :-tabmove<CR>
noremap tmi :+tabmove<CR>

autocmd BufRead,BufNewFile *.md setlocal spell


" Opening a terminal window
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>


" Compile function
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		set splitbelow
		:sp
		:res -5
		term gcc -ansi -Wall % -o %< && time ./%<
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'cs'
		set splitbelow
		silent! exec "!mcs %"
		:sp
		:res -5
		:term mono %<.exe
	elseif &filetype == 'java'
		set splitbelow
		:sp
		:res -5
		term javac % && time java %<
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc


" =======================
" ===  plugins  begin ===
" =======================
call plug#begin('~/.config/nvim/plugged')
  Plug 'vim-airline/vim-airline'
  Plug 'luochen1990/rainbow'
  Plug 'mg979/vim-xtabline'
  Plug 'ryanoasis/vim-devicons'
  Plug 'wincent/terminus'
  Plug 'morhetz/gruvbox'
  Plug 'tpope/vim-fugitive'
  Plug 'preservim/nerdtree'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'scrooloose/syntastic'
call plug#end()
colorscheme gruvbox



