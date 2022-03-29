filetype plugin indent on

set number
set relativenumber
set ruler
set hlsearch
let &t_ut=''
set expandtab
set listchars=tab:▸\ ,trail:▫	
set backspace=indent,eol,start	
set noeb
set laststatus=2
set autoindent
set confirm
set foldmethod=indent
set foldlevel=99
set tabstop=2
set shiftwidth=2
set softtabstop=2
set noswapfile
set nobackup
set ignorecase
set list
set smartcase
set notimeout
set mouse=a
set cursorline
set wrap
set wildmenu
set showcmd
set expandtab
set nowritebackup
set undolevels=10000         " use many levels of undo
set history=10000    " After nocompatible
set smarttab

vnoremap Y "+y
nmap P "+p

au BufReadPost * if line("''\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
set encoding=utf-8
syntax on
noremap <leader>n :NERDTreeFocus<CR>



"markdownmap
nmap ,m <Plug>MarkdownPreview<CR>
nmap ,ms <Plug>MarkdownPreviewStop<CR>


" disable the s key
noremap s <nop>
vnoremap Y "+y

nnoremap <SPACE> <Nop>
map <Space> <Leader>
noremap J 5j
noremap K 5k

noremap su :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sd :set splitbelow<CR>:split<CR>
noremap sl :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sr :set splitright<CR>:vsplit<CR>

map s<up> :res +5<CR>
map s<down> :res -5<CR>
map s<left> :vertical resize-5<CR>
map s<right> :vertical resize+5<CR>

imap ,, <Esc>
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
noremap <sLEADER>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>


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
		:res -5
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

  Plug 'easymotion/vim-easymotion'

  Plug 'skywind3000/vim-terminal-help'

  Plug 'luochen1990/rainbow'

  Plug 'tpope/vim-surround'

  Plug 'tomtom/tcomment_vim'

  Plug 'mg979/vim-xtabline'

  Plug 'ryanoasis/vim-devicons'

  Plug 'wincent/terminus'

  Plug 'morhetz/gruvbox'

  Plug 'tpope/vim-fugitive'

  Plug 'vim-airline/vim-airline-themes'

  Plug 'preservim/nerdtree'

  Plug 'ctrlpvim/ctrlp.vim'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  Plug 'tomasiser/vim-code-dark'

  Plug 'mbbill/undotree'

  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

  Plug 'scrooloose/syntastic'

  Plug 'cateduo/vsdark.nvim'

  Plug 'jackguo380/vim-lsp-cxx-highlight'

  Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-rust --enable-python'}

  Plug 'vim-scripts/taglist.vim'

  Plug 'junegunn/vim-easy-align'

  Plug 'scrooloose/nerdcommenter'

  Plug 'nathanaelkane/vim-indent-guides'

  Plug 'mhinz/vim-startify'

  Plug 'itchyny/calendar.vim'

  Plug 'altercation/vim-colors-solarized'

  Plug 'Raimondi/delimitMate'

  Plug 'Chiel92/vim-autoformat'

call plug#end()


let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
" =======================
" ===   plugins  end  ===
" =======================


" =================================
" ===   plugins  configuration  ===
" =================================
" 
"
"===========undotree===============
if has('persistent_undo')
  set undodir=$HOME/.vim/undo
  set undofile 
endif 

"auto format
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
noremap ,f :Autoformat<CR>
let g:autoformat_verbosemode=1


" 1. vscode defult 2. author defult 3. vscode show
"	\	'guifgs': ['#B21212', '#1B9CED','#FFFC00'],
"	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
"	\	'guifgs': ['#C186BF', '#268EDB','#F79318'],
	let g:rainbow_conf = {
	\	'guifgs': ['#C186BF', '#268EDB','#F79318'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}
let g:rainbow_active = 1

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"===========Taglist==========
nnoremap <leader>t :TlistToggle<CR>
let Tlist_Use_Right_Window   = 1
"===========undotree=========
nnoremap <leader>u :UndotreeToggle<CR>
if has("persistent_undo")
   let target_path = expand('~/.undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif

" ==== jackguo380/vim-lsp-cxx-highlight ====
hi default link LspCxxHlSymFunction cxxFunction
hi default link LspCxxHlSymFunctionParameter cxxParameter
hi default link LspCxxHlSymFileVariableStatic cxxFileVariableStatic
hi default link LspCxxHlSymStruct cxxStruct
hi default link LspCxxHlSymStructField cxxStructField
hi default link LspCxxHlSymFileTypeAlias cxxTypeAlias
hi default link LspCxxHlSymClassField cxxStructField
hi default link LspCxxHlSymEnum cxxEnum
hi default link LspCxxHlSymVariableExtern cxxFileVariableStatic
hi default link LspCxxHlSymVariable cxxVariable
hi default link LspCxxHlSymMacro cxxMacro
hi default link LspCxxHlSymEnumMember cxxEnumMember
hi default link LspCxxHlSymParameter cxxParameter
hi default link LspCxxHlSymClass cxxTypeAlias

" ===
" === eleline.vim
" ===
let g:airline_powerline_fonts = 0

" ==== neoclide/coc.nvim ====

" coc extensions
let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-tsserver',
      \ 'coc-css',
      \ 'coc-html',
      \ 'coc-vimlsp',
      \ 'coc-cmake',
      \ 'coc-highlight',
      \ 'coc-pyright'
      \ ]


set signcolumn=number

" <TAB> to select candidate forward or
" pump completion candidate

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
" <s-TAB> to select candidate backward

inoremap <expr><s-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.')-1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" <CR> to comfirm selected candidate
" only when there's selected complete item
if exists('*complete_info')
  inoremap <silent><expr> <CR> complete_info(['selected'])['selected'] != -1 ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nnoremap <silent>X :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if(index(['vim', 'help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f <Plug>(coc-format-selected)
command! -nargs=0 Format :call CocAction('format')

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" diagnostic info
nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<CR>
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)
nmap ,qf <Plug>(coc-fix-current)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :tab sp<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" ==== puremourning/vimspector ====
let g:vimspector_enable_mappings = 'HUMAN'

function! s:generate_vimspector_conf()
  if empty(glob( '.vimspector.json' ))
    if &filetype == 'c' || 'cpp' 
      !cp ~/.config/nvim/vimspector_conf/c.json ./.vimspector.json
    elseif &filetype == 'python'
      !cp ~/.config/nvim/vimspector_conf/python.json ./.vimspector.json
    endif
  endif
  e .vimspector.json
endfunction

command! -nargs=0 Gvimspector :call s:generate_vimspector_conf()

nmap <Leader>v <Plug>VimspectorBalloonEval
xmap <Leader>v <Plug>vimspectorBalloonEval

syntax enable
set background=dark
colorscheme gruvbox

" ==== syntastic ====
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_cpp_compiler_options = ' --std=c++17'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"=========markdown preview===========
"" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if dable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

"================calendar===============
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
noremap \\ :Calendar -view=clock -position=here<CR>
noremap \c :Calendar -position=here<CR>
source ~/.cache/calendar.vim/credentials.vim

"=================easymotion============




