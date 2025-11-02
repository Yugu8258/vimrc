" base setting
set guicursor&vim 
set laststatus=2

set scrolloff=8

set number
set relativenumber
set cursorline

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

set wrap
set linebreak
set nolist

set fileformat=unix

call plug#begin()

" List your plugins here
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'itchyny/lightline.vim'

Plug 'ayu-theme/ayu-vim'

Plug 'machakann/vim-highlightedyank'

call plug#end()

" This was from the colorscheme section
syntax on
set t_Co=256 
set termguicolors
let ayucolor="mirage"
colorscheme ayu

" Our remaps
let mapleader = " "
nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :so ~/.vimrc<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>
vnoremap <leader>p "_dP
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" 禁用普通模式下的方向键
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" 禁用插入模式下的方向键（可选，进一步强制使用 hjkl）
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" 禁用可视化模式下的方向键（可选）
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>

" 在文件末尾追加新的一行
function! AddLastLine()
    if getline('$') !~ "^$"
        call append(line('$'), '')
    endif
endfunction

autocmd BufWritePre * call AddLastLine()

" Hightlight yanking
highlight HighlightedyankRegion cterm=reverse gui=reverse
let g:highlightedyank_highlight_duration = 300
