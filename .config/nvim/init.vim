" === Plugins ===
call plug#begin('~/.local/share/nvim/plugged')

Plug 'jiangmiao/auto-pairs'                                 " Insert or delete brackets, parens, quotes in pair
Plug 'tpope/vim-surround'                                   " quoting/parenthesizing made simple
Plug 'tpope/vim-commentary'                                 " Comment stuff out
Plug 'itchyny/lightline.vim'                                " A light and configurable statusline/tabline for Vim

Plug 'othree/yajs.vim', { 'for': 'javascript' }
" Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
" Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'tmux-plugins/vim-tmux'

Plug 'fneu/breezy'                                          " Colorscheme inspired by KDE breezy template
Plug 'davidklsn/vim-sialoquent'
Plug 'arcticicestudio/nord-vim'
Plug 'dikiaap/minimalist'
Plug 'KeitaNakamura/neodark.vim'

call plug#end()
" Automatically executes
" filetype plugin indent on
" syntax enable

" === Plugin Options ===
let g:lightline = { 'colorscheme': 'breezy' }


" === UI Options ===
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=2
set ruler               " Line and column of cursor
set number              " Line numbers
set showcmd             " Show (partial) command in status line
set showmode            " Show current mode
"set showmatch           " Show matching brackets
set noerrorbells        " No beeps
" set termguicolors       " Uses guifg,guibg highlight attributes

" === Colorscheme ===
colorscheme neodark
highlight Normal guibg=NONE ctermbg=NONE

" === Search Options ===
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters
"set gdefault            " Use 'g' flag by default with :s/foo/bar/
"set magic               " Use 'magic' patterns (extended regular expressions)

" === Behaviour Options ===
set scrollopt+=hor      " Add horizontal scrolling to scrollbind
set splitbelow          " Horizontal split below current
set splitright          " Vertical split to right of current

" === Tab Settings ===
set tabstop=4
set shiftwidth=4
set softtabstop=0
set expandtab
set smarttab
au FileType javascript setlocal sw=2 sts=2 et

" === Key Bindings ===
let mapleader="\<SPACE>"
nnoremap <Leader>s :%s//g<Left><Left>

" === Insert Mode Mappings ===
inoremap ;; <ESC>

" === Normal Mode Mappings ===
nnoremap '' :noh<CR>

nnoremap <S-Enter> O<Esc>
nnoremap <CR> o<Esc>

nnoremap <S-h> :tabp<CR>
nnoremap <S-l> :tabn<CR>
nnoremap <S-y> :tabm -1<CR>
nnoremap <S-o> :tabm +1<CR>
