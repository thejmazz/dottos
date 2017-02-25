" === Plugins ===
call plug#begin('~/.local/share/nvim/plugged')

Plug 'jiangmiao/auto-pairs'                                 " Insert or delete brackets, parens, quotes in pair
Plug 'tpope/vim-surround'                                   " quoting/parenthesizing made simple
Plug 'tpope/vim-commentary'                                 " Comment stuff out
Plug 'itchyny/lightline.vim'                                " A light and configurable statusline/tabline for Vim
Plug 'airblade/vim-gitgutter'                               " Shows a git diff in the gutter (sign column) and stages/undoes hunks
Plug 'itchyny/calendar.vim'                                 " A calendar application for Vim
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Dark powered asynchronous completion framework

Plug 'tikhomirov/vim-glsl'                                  " OpenGL Shading Language
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }        " CoffeeScript
Plug 'othree/yajs.vim', { 'for': 'javascript' }             " JavaScript
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }   " ESNext
Plug 'mxw/vim-jsx'                                          " JSX syntax highlighting and indenting
Plug 'elzr/vim-json', { 'for': 'json' }                     " Better JSON
Plug 'tmux-plugins/vim-tmux'                                " For .tmux.conf

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
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

let g:deoplete#enable_at_startup = 1

let g:lightline = {
    \ 'colorscheme': 'breezy',
    \ 'tabline': {
    \   'left': [ [ 'tabs' ] ],
    \   'right': [ [] ]
    \ },
    \ 'tab': {
    \   'active': [ 'filename', 'modified' ],
    \   'inactive': [ 'filename', 'modified' ]
    \ },
    \ 'tabline_subseparator': { 'left': '', 'right': '' }
    \ }


" === UI Options ===
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=2
set ruler               " Line and column of cursor
set number              " Line numbers
" set showcmd             " Show (partial) command in status line
set showmode            " Show current mode
"set showmatch           " Show matching brackets
set noerrorbells        " No beeps
set termguicolors       " Uses guifg,guibg highlight attributes

" === netrw options ===
let g:netrw_banner = 0              " Hide banner
" let g:netrw_browse_split = 4        " Open files in previous window
let g:netrw_winsize = 25            " Set width to 25%

" === Colorscheme ===
colorscheme neodark
highlight Normal guibg=NONE ctermbg=NONE
highlight VertSplit guibg=NONE guifg=#282c33

" === Search Options ===
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters
"set gdefault            " Use 'g' flag by default with :s/foo/bar/
"set magic               " Use 'magic' patterns (extended regular expressions)

" === Behaviour Options ===
set scrollopt+=hor      " Add horizontal scrolling to scrollbind
set splitbelow          " Horizontal split below current
set splitright          " Vertical split to right of current
set scrolloff=10        " Always show 10 lines above/below
set autochdir           " Automatically changing working directory to match current file
set nowrap              " No edge wrapping by default


" === Tab Settings ===
set tabstop=4
set shiftwidth=4
set softtabstop=0
set expandtab
set smarttab
au FileType javascript setlocal sw=2 sts=2 et
au FileType javascript.jsx setlocal sw=2 sts=2 et

" === Key Bindings ===
let mapleader="\<SPACE>"
nnoremap <Leader>s :%s//g<Left><Left>
" map <leader>ts :call ToggleScrollbar()<CR>

" === Insert Mode Mappings ===
inoremap ;; <ESC>

" === Normal Mode Mappings ===
" deoplete tab complete
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


nnoremap '' :noh<CR>
nnoremap gb :ls<CR>:b<Space>

nnoremap gff gf 
nnoremap gft <C-w>gf
nnoremap gfs <C-w>f
nnoremap gfv <C-w>vgf

nnoremap } }j
nnoremap { {k

nnoremap <S-Enter> O<Esc>
nnoremap <CR> o<Esc>

nnoremap <m-h> <C-w>h
nnoremap <m-j> <C-w>j
nnoremap <m-k> <C-w>k
nnoremap <m-l> <C-w>l

nnoremap <S-h> :tabp<CR>
nnoremap <S-l> :tabn<CR>
nnoremap <S-y> :tabm -1<CR>
nnoremap <S-o> :tabm +1<CR>

function! DownStep()
    let col = col(".") - 1

    let spaces = ""
    for i in range(0, col - 1)
        let spaces = spaces . " "
    endfor

    let prefix = "^\\n"
    let postfix = '[a-z/\/"#]'

    let pattern = prefix . spaces . postfix

    " echo pattern
    call search(pattern, "e")
endfunction

function! UpStep()
    let col = col(".") - 1

    let spaces = ""
    for i in range(0, col - 1)
        let spaces = spaces . " "
    endfor

    let prefix = "^\\n"
    let postfix = '[a-z/\/"#]'

    let pattern = prefix . spaces . postfix

    " echo pattern
    call search(pattern, "be")
endfunction

nnoremap <S-j> :call DownStep()<CR>
nnoremap <S-k> :call UpStep()<CR>

nnoremap ftj :set filetype=javascript<CR>
nnoremap ftg :set filetype=glsl<CR>

nnoremap <Leader>r :source $MYVIMRC<CR>
nnoremap <Leader>v :tabe $MYVIMRC<CR>

" inoremap <expr><C-e> deoplete#smart_close_popup()."\<C-e>"
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
