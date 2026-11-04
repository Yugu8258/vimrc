" ==============================================
" Base Editor Settings
" ==============================================
" Restore default GUI cursor
set guicursor&

" Always show status line
set laststatus=2

" Keep 8 lines of context above/below cursor
set scrolloff=8

" Show absolute & relative line numbers
set number
set relativenumber

" Highlight current cursor line
set cursorline

" Tab & indent configuration
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab       " Use spaces instead of tabs
set smartindent     " Smart indent for code

" Encoding settings
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" Line wrapping
set wrap            " Wrap long lines
set linebreak       " Break lines at word boundaries
set nolist          " Do not display invisible characters

" Use Unix line endings
set fileformat=unix

" ==============================================
" Plugin Management (vim-plug)
" ==============================================
call plug#begin()

" Fuzzy finder core & UI
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Status line theme
Plug 'itchyny/lightline.vim'

" Ayu color scheme
Plug 'ayu-theme/ayu-vim'

" Highlight yanked text temporarily
Plug 'machakann/vim-highlightedyank'

call plug#end()

" ==============================================
" Color Scheme Configuration
" ==============================================
syntax on               " Enable syntax highlighting
set t_Co=256            " Enable 256-color support
set termguicolors       " Enable true color

let ayucolor="mirage"   " Use Ayu Mirage variant
colorscheme ayu
let g:lightline = { 'colorscheme': 'ayu_mirage' }

" Transparent background
let g:ayu_mirage_transparent = 1
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE
highlight VertSplit ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE

" ==============================================
" Key Mappings
" ==============================================
" Set space as leader key
let mapleader = " "

" Open file explorer
nnoremap <leader>pv :Vex<CR>

" Reload vimrc config
nnoremap <leader><CR> :so ~/.vimrc<CR>

" FZF file search shortcuts
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>

" Paste over selection without overwriting default register
vnoremap <leader>p "_dP

" Copy to system clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" Move selected lines up/down in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Disable arrow keys (force using hjkl)
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>

" ==============================================
" Yank Highlight Configuration
" ==============================================
" Highlight style for yanked region
highlight HighlightedyankRegion cterm=reverse gui=reverse
" Highlight duration (milliseconds)
let g:highlightedyank_highlight_duration = 300
