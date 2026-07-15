" ==============================================
" Basic Vim Editor Settings
" ==============================================
" Restore default GUI cursor settings for terminal compatibility
set guicursor&vim
" Always display status line (2 = always show)
set laststatus=2
" Keep 8 lines of padding above/below cursor when scrolling
set scrolloff=8

" Line number configuration
set number                  " Show absolute line numbers
set relativenumber          " Show relative line numbers for quick jumping
set cursorline              " Highlight current cursor line

" Indentation & Tab settings (standard 4-space indent)
set tabstop=4               " Number of spaces a tab character occupies
set softtabstop=4           " Number of spaces for tab/backspace operations
set shiftwidth=4            " Auto-indent width for code blocks
set expandtab               " Convert tab keys to spaces
set smartindent             " Enable smart indentation for programming languages

" Encoding settings (full UTF-8 support)
set encoding=utf-8          " Internal Vim encoding
set fileencoding=utf-8      " Default file save encoding
set fileencodings=utf-8     " Priority list for file encoding detection

" Text wrapping & display settings
set wrap                    " Wrap long lines at window edge
set linebreak               " Break lines at word boundaries (no broken words)
set nolist                  " Disable invisible character symbols (tabs/spaces)

" File format settings (Unix line ending compatibility)
set fileformat=unix         " Use LF line endings for cross-platform compatibility

" ==============================================
" Plugin Management (Vim-Plug)
" ==============================================
call plug#begin('~/.vim/plugged')

" FZF - Fuzzy file search core engine (auto install binaries)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" FZF.vim - Vim integration for fzf fuzzy finder
Plug 'junegunn/fzf.vim'

" Lightline.vim - Lightweight status line theme
Plug 'itchyny/lightline.vim'

" Ayu-vim - Elegant minimalist color scheme
Plug 'ayu-theme/ayu-vim'

" Highlightedyank - Highlight text after yank/copy operation
Plug 'machakann/vim-highlightedyank'

call plug#end()

" ==============================================
" Color Scheme & Syntax Highlighting
" ==============================================
syntax on                   " Enable file syntax highlighting
set t_Co=256                " Enable 256-color terminal support
set termguicolors           " Enable true RGB color support for modern terminals
let ayucolor="mirage"       " Set ayu theme variant (mirage/dark/light)
colorscheme ayu             " Apply ayu color scheme

" ==============================================
" Custom Key Remappings
" ==============================================
" Set space key as custom leader key for shortcuts
let mapleader = " "

" Normal mode mappings
nnoremap <leader>pv :Vex<CR>               " Open vertical file explorer
nnoremap <leader><CR> :so ~/.vimrc<CR>    " Reload .vimrc config manually
nnoremap <C-p> :GFiles<CR>                " Fuzzy search git tracked files
nnoremap <leader>pf :Files<CR>            " Fuzzy search all project files
nnoremap <leader>y "+y                    " Yank single line to system clipboard
nnoremap <leader>Y gg"+yG                 " Yank entire file content to system clipboard

" Visual mode mappings
vnoremap <leader>p "_dP                   " Paste without overwriting default register
vnoremap <leader>y "+y                    " Yank selected text to system clipboard
vnoremap J :m '>+1<CR>gv=gv               " Move selected text down and auto-indent
vnoremap K :m '<-2<CR>gv=gv               " Move selected text up and auto-indent

" Disable arrow keys in all modes (force hjkl navigation)
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
" Custom Auto Commands & Functions
" ==============================================
" Auto add blank line at end of file on save (POSIX standard)
function! AddLastLine()
    " Check if last line is not empty
    if getline('$') !~ "^$"
        call append(line('$'), '')
    endif
endfunction
autocmd BufWritePre * call AddLastLine()

" ==============================================
" Yank Highlight Plugin Configuration
" ==============================================
" Set yank highlight style (reverse foreground/background)
highlight HighlightedyankRegion cterm=reverse gui=reverse
" Set yank highlight duration to 300 milliseconds
let g:highlightedyank_highlight_duration = 300
