"  __  __        __     _____ __  __ ____   ____
" |  \/  |_   _  \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| | | | |  \ \ / / | || |\/| | |_) | |
" | |  | | |_| |   \ V /  | || |  | |  _ <| |___
" |_|  |_|\__, |    \_/  |___|_|  |_|_| \_\\____|
"         |___/

set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
let &t_ut=''
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
set clipboard=unnamed
let g:SnazzyTransparent = 1


" 代码高亮
syntax on
let mapleader=" "
" 设置行号
set number
set relativenumber

" 在当前光标显示一条线
set cursorline

" 字不会超出当前窗口到位置
set wrap

" 显示当前输入的命令
set showcmd

" 自动补全命令
set wildmenu

" 设置高亮搜索
set hlsearch " 设置高亮
set incsearch " 边输入边高亮
" 在vim中运行一个指令，取消高亮
" exec "nohlsearch" 
set ignorecase
set smartcase

" 设置退出到模式
map S :w<CR>
map s <nop>
map Q :q<CR>
map R :source $MYVIMRC<CR>
" 把0和$以及：换位置
noremap Y 0
noremap U $
noremap ; :

" 方向插入键改为jkli和h
noremap j h
noremap k j
noremap i k
noremap I 7k
noremap K 7j
noremap J 5h
noremap L 5l
noremap e j
noremap h i
noremap H I
" 快速注释

" 搜索键设置为加减号
" noremap = nzz
" noremap - Nzz
" noremap + 3nzz
" noremap _ 3Nzz

" 上下左右分屏设置
map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR>
map si :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>

"上下左右键改变分屏的大小
map z<up> :res +5<CR> 
map z<down> :res -5<CR> 
map z<left> :vertical resize+5<CR> 

map z<right> :vertical resize-5<CR> 

" 分屏切换垂直到水平或水平到垂直
map sh <C-w>t<C-w>H
map sv <C-w>t<C-w>K
" 光标快捷移动
map zj <C-w>h
map zk <C-w>j
map zi <C-w>k
map zl <C-w>l

" 标签页快捷操作
map tu :tabe<CR>
map tj :-tabnext<CR>
map tl :+tabnext<CR>

" 删除所有高亮搜索结果
noremap b :nohlsearch<CR>

" 安装插件plug
call plug#begin()

noremap zx :PlugInstall<CR> 
" 任务栏美化
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'

" 主题snazzy美化
Plug 'connorholyday/vim-snazzy'
Plug 'morhetz/gruvbox'
Plug 'theniceboy/nvim-deus'
" latex preview
Plug 'xuhdev/vim-latex-live-preview'

Plug 'Yggdroot/indentLine'

" snippets
" Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

"coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Markdown Preview
Plug 'dhruvasagar/vim-table-mode'
Plug 'suan/vim-instant-markdown'
call plug#end()

" gruvbox
colorscheme snazzy

" ===
" === latex-vim
" ===

autocmd Filetype tex setl updatetime=300
let g:livepreview_previewer = 'open -a Skim'
nmap mm :LLPStartPreview<CR>

" ===
" === snippets
" ===
" inoremap <silent><expr> <TAB>
      " "\ pumvisible() ? coc#_select_confirm() :
      " "\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      " "\ <SID>check_back_space() ? "\<TAB>" :
      " "\ coc#refresh()

" Use <C-l> for trigger snippet expand.
imap <C-e> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-i> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-i>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-i> <Plug>(coc-snippets-expand-jump)

"function! s:check_back_space() abort
  "let col = col('.') - 1
  "return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

" let g:coc_snippet_next = '<tab>'
let g:snips_author = 'wuyufffan'

map tx :edit ~/.vim/plugged/vim-snippets/UltiSnips/tex.snippets<CR>
map tm :edit ~/.vim/plugged/vim-snippets/UltiSnips/texmath.snippets<CR>
map tv :edit ~/.vim/plugged/vim-snippets/UltiSnips/vim.snippets<CR>
map mak :edit ~/.vim/mdSnippits.vim<CR>
map rc :edit ~/.vim/vimrc<CR>
map sp :CocCommand snippets.editSnippets<CR>

" ===
" === markdown
" ===
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

source ~/.vim/mdSnippits.vim

let g:instant_markdown_mathjax=1

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" ===
" === coc.nvim
" ===

let g:coc_global_extensions = [
  \'coc-json',
  \'coc-vimlsp',
  \'coc-marketplace',
  \'coc-python',
  \'coc-pyright',
  \'coc-clangd',
  \'coc-actions',
  \'coc-texlab',
  \'coc-vimtex',
  \'coc-explorer',
  \'coc-snippets']


let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level           = 2  " 从第二层开始可视

nnoremap tt :CocCommand explorer<CR>
noremap cfg :CocConfig<CR>
set updatetime=10


inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" ===
" === vim-wiki
" ===
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

