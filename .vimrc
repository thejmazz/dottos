set nocompatible
filetype off

if empty(glob("~/.vim/bundle/Vundle.vim"))
    silent! execute '!git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim'
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Vundle, the plug-in manager for Vim
Plugin 'gmarik/Vundle.vim'
" addon-mw-utils: interpret a file by function and cache file automatically
Plugin 'marcweber/vim-addon-mw-utils'
" tlib: some utility functions for VIM
Plugin 'tomtom/tlib_vim'
" nerdtree: a tree explorer plugin for vim
Plugin 'scrooloose/nerdtree'
" nerdtree-tabs: NERDTree and tabs together in Vim, painlessly
Plugin 'jistr/vim-nerdtree-tabs'
" fugitive: a Git wrapper so awesome, it should be illegal
Plugin 'tpope/vim-fugitive'
" airline: lean & mean status/tabline for vim that's light as air
Plugin 'bling/vim-airline'
" A collection of themes for vim-airline
Plugin 'https://github.com/vim-airline/vim-airline-themes'
" snipmate: support for textual snippets
Plugin 'garbas/vim-snipmate'
" snippets: vim-snipmate default snippets
Plugin 'honza/vim-snippets'
" emmet: emmet for vim
Plugin 'mattn/emmet-vim'
" autoformat: provide easy code formatting in Vim by integrating existing code formatters
Plugin 'Chiel92/vim-autoformat'
" javascript-syntax: enhanced javascript syntax for Vim
" Plugin 'jelera/vim-javascript-syntax'
" surround: quoting/parenthesizing made simple
Plugin 'tpope/vim-surround'
" repeat.vim: enable repeating supported plugin maps
Plugin 'tpope/vim-repeat'
" auto-pairs: insert or delete brackets, parens, quotes in pair
Plugin 'jiangmiao/auto-pairs'
" misc: miscellaneous auto-load Vim scripts
Plugin 'xolox/vim-misc'
" session: extended session manegement for Vim (:mksession on steroids)
Plugin 'xolox/vim-session'
" go: Go developoment plugin for Vim
Plugin 'fatih/vim-go'
" jshint.vim: a plugin that integrates JSHint with Vim
Plugin 'walm/jshint.vim'
" tabular: Vim script for text filtering and alignment
Plugin 'godlygeek/tabular'
" VIM Table Mode for instant table creation
Plugin 'dhruvasagar/vim-table-mode'
" Markdown Vim Mode
Plugin 'plasticboy/vim-markdown'
" commentary.vim: comment stuff out
Plugin 'tpope/vim-commentary'
autocmd FileType conf setlocal commentstring=#\ %s
" one colorscheme pack to rule them all!
Plugin 'flazz/vim-colorschemes'
" CoffeeScript support for vim
Plugin 'kchmck/vim-coffee-script'
" base-16-vim colour scheme
Plugin 'chriskempson/base16-vim'
" A code-completion engine for Vim
Plugin 'Valloric/YouCompleteMe'
" A Vim plugin which shows a git diff in the gutter (sign column) and stages/reverts hunks
Plugin 'airblade/vim-gitgutter'
" Plugin to work with R
"Plugin 'vim-scripts/Vim-R-plugin'
Plugin 'jalvesaq/Nvim-R'
" A Filetype plugin for csv files
Plugin 'chrisbra/csv.vim'
" Create your own submodes
Plugin 'kana/vim-submode'
" List of JavaScript ES6 snippets and syntax highlighting for vim
Plugin 'isRuslan/vim-es6'
" Generate JSDoc to your JavaScript code
Plugin 'heavenshell/vim-jsdoc'
" Fold in lines matching regex, word under cursor, etc
Plugin 'embear/vim-foldsearch'
" JSON syntax
Plugin 'elzr/vim-json'
" Vim syntax file and snippets for Docker's Dockerfile
Plugin 'ekalinin/Dockerfile.vim'
" Vim syntax and language settings for RAML
Plugin 'IN3D/vim-raml'
" Run interactive commands inside a Vim buffer
Plugin 'lrvick/Conque-Shell'
" Preview colours in source code while editing
Plugin 'ap/vim-css-color'
" Vim Pug (formerly Jade) template engine syntax highlighting and indention
Plugin 'digitaltoad/vim-pug'
" Plugin to manage Most Recently Used (MRU) files
Plugin 'vim-scripts/mru.vim'
" Adaptation of one-light and one-dark colorschemes for Vim
Plugin 'rakr/vim-one'
" Syntax Highlight for Vue.js components
Plugin 'posva/vim-vue'
" Better whitespace highlighting for Vim
Plugin 'ntpeters/vim-better-whitespace'
" Move lines and selections up and down
Plugin 'matze/vim-move'
" Improved incremental searching
Plugin 'haya14busa/incsearch.vim'
" Vim runtime files for OpenGL Shading Language
Plugin 'tikhomirov/vim-glsl'
" vim plugin for tmux.conf
Plugin 'tmux-plugins/vim-tmux'
Plugin 'mbbill/vim-seattle'

call vundle#end()
filetype plugin indent on

" Vundle commands
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

:set autochdir
set cursorline

syntax on
syntax enable

" Mappings
" Remap <ESC> to easily leave insert mode
inoremap ,, <ESC>
" Change timeout so that typing i in insert mode is not as distracting
set timeout timeoutlen=500 ttimeoutlen=0
map <S-Right> :tabn<CR>
map <S-Left> :tabp<CR>
map <S-h> :tabp<CR>
map <S-l> :tabn<CR>
map <C-n> :tabnew<CR>
nnoremap <S-y> :tabm -1<CR>
nnoremap <S-o> :tabm +1<CR>
map <F2> :NERDTreeTabsToggle<CR>
nnoremap <silent><F3> :call g:ToggleColorColumn()<CR>
map <F7> :setlocal spell! spelllang=en_ca<CR>
map <F12> :SaveSession<CR>
map <F10> :JSHint<CR>
map <C-n><C-n> :set invnumber<CR>
nmap =j :%!python -m json.tool<CR>
" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" nnoremap ∆ <C-W><C-J>
" nnoremap ˚ <C-W><C-K>
" nnoremap ¬ <C-W><C-L>
" nnoremap ˙ <C-W><C-H>
" Change split sizes
map <C-u> :resize +1 <CR>
map <C-i> :resize -1 <CR>
map <C-p> :resize +9001 <CR>
" Quick way to turn off search results highlighting
nnoremap '' :noh<CR>
" Use ctrl-[up|down] to scroll w/o moving cursor
map <C-Down> <C-E>
map <C-Up> <C-Y>
" Blank line w/o going to insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
" Easier open file under cursor in new tab
nnoremap ffg <C-W>gf
" For better LaTeX formatting
omap lp ?^$\\|^\s*\(\\begin\\|\\end\\|\\label\\|\\item\)?1<CR>//-1<CR>.<CR>
" Autocomplete {
"inoremap {<CR> {<CR>}<Esc>ko
"inoremap ( ()<Esc>ko
" Visual Mode mappings
vmap gb :TCommentBlock<CR>
" For incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

let mapleader=' '
let maplocalleader=','

" let NERDTreeMapOpenInTab='<ENTER>'
" let g:NERDTreeMapOpenInTabSilent = '<2-LeftMouse>'


" Automatic commands on startup
au BufRead * normal zR
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.js set filetype=javascript
autocmd BufNewFile,BufRead .babelrc set filetype=json
" autocmd! GUIEnter * set vb t_vb=
set noeb vb t_vb=

" Make r-vim use terminal emulator
let vimrplugin_applescript=0
" Turn off _ -> <-
let R_assign=0

let g:nerdtree_tabs_open_on_gui_startup=0
let g:ycm_autoclose_preview_window_after_insertion = 1

set hlsearch

:command OS OpenSession

" No line wrapping
set nowrap
" Always show 10 lines above/below
set scrolloff=10

" Setup for  vim-airline
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
"let g:airline_theme='twilight' "This is lost forever now :(
" Favorite themes:
" tomorrow: nice, minimal
" luna: nice, colourful
" murmur: needs main bar colour
" bubblegum: simple, minimal
" durant: nice insert, purple main on edit though
" hybrid: nice normal
" hybridline: nice insert
" let g:airline_theme='luna'
" let g:airline_theme='murmur'
let g:airline_theme='bubblegum'
" let g:airline_theme='one'
"let g:airline_theme='durant'
" The ultimate theme would be:
" tomorrow modified to be
"       normal: hybrid
"       visual: self
"       insert: hybridline
let g:airline#extensions#whitespace#enabled=0

" Custom submodes

" disable submode timeouts:
let g:submode_timeout = 0
" don't consume submode-leaving key
" let g:submode_keep_leaving_key = 1

" call submode#enter_with('R', 'n', '', '<leader>a', 'ofirst line <ESC>')
" call submode#enter_with('R', 'n', '', '<leader>r', '<leader>d')
" call submode#map('R', 'n', '', 'a', '<leader>d')
" call submode#map('R', 'n', '', 'd', '<leader>d')


" vim-session settings
:let g:session_autosave = 'no'

" vim-go settings
let g:go_fmt_autosave = 0

" Enhanced JS syntax
" au FileType javascript call JavaScriptFold()

" Markdown table settings for table-mode
let g:table_mode_corner="|"

" Enable 256 Colours
" Default colorscheme
" colorscheme twilight
" colorscheme hybridbrackets
" set background=light
" colorscheme solarized
set t_Co=256
"set background=dark
"colorscheme monokai
" colorscheme Kafka
set background=dark
" colorscheme oceandeep
"let base16colorspace=256  " Access colors present in 256 colorspace"
"colorscheme base16-ocean
" highlight Normal ctermbg=NONE
" highlight nonText ctermbg=NONE
" Line number colours
"highlight LineNr ctermfg=170 ctermbg=232
"highlight Comment ctermfg=145
" Color column
" Run with silent! since it will fail until PluginInstall is done
silent! colorscheme seattle
"highlight ColorColumn ctermbg=111

" === Custom Highlights ===
highlight Normal ctermbg=none
highlight Comment ctermbg=none
highlight LineNr ctermfg=8 ctermbg=none
highlight NonText ctermbg=none
highlight TabLineSel ctermbg=none ctermfg=green cterm=none
highlight TabLine cterm=none ctermbg=none
highlight TabLineFill cterm=none ctermfg=none ctermbg=none

" Show statusline
set laststatus=2
" Enable mouse scrolling
set mouse=nicr
" Set up tabs
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
au FileType javascript setl sw=2 sts=2 et
au FileType yaml setl sw=2 sts=2 et
" Show line numbers
set number
" Text width at 80 characters
set textwidth=80
" Turn off automatic text wrapping
set formatoptions-=t
"Above may not work, fo overwritten somewhere else, so:
autocmd BufNewFile,BufRead * setlocal formatoptions-=t
" Enable soft-wrap
"set wrap linebreak nolist

" whitespace highlighting
highlight ExtraWhitespace ctermbg=red guibg=#be5046
" NERDTREE split highlighting to match vim-one
highlight VertSplit guibg=#282b34 guifg=#282b34

" Strip whitespace on write
" see g:better_whitespace_filetypes_blacklist for exceptions
autocmd BufWritePre * StripWhitespace

" Snakemake syntax highlighting
au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead *.rules set syntax=snakemake
au BufNewFile,BufRead *.snakefile set syntax=snakemake
au BufNewFile,BufRead *.snake set syntax=snakemake

" Highlight text past 80 characters
"augroup vimrc_autocmds
"   autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
"   autocmd BufEnter * match OverLength /\%81v.*/
"augroup END

" Automatically reload vimrc on changes
" augroup myvimrc
"     au!
"     au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
" augroup END

" ==== Commands ====

command GetWidth echom LongestLineLength()
command Vsp call VSplitAutoResize()
command Sp call SplitAutoResize()

" ==== Functions ====

function AutoformatAndSave()
    :Autoformat
    :wq
endfunction

" Toggles colorcolumn at textwidth+1
function! g:ToggleColorColumn()
    if &colorcolumn != ''
        setlocal colorcolumn&
    else
        setlocal colorcolumn=+1
    endif
endfunction

function! SplitAutoResize()
    exe ":sp"
    exe ':resize ' . line('$')
endfunction

function! VSplitAutoResize()
    exe ":vsp"
    exe ':vertical resize ' . LongestLineLength()
    " Wrap when files wider than 90
    if LongestLineLength() > 90
        exe ":set wrap"
    endif
    exe ":0"
endfunction

" Returns width of longest line
" Modified from http://stackoverflow.com/a/2075372/1409233
function! LongestLineLength ( )
    let maxlength   = 0
    let linenumber  = 1
    let longestline = 0
    while linenumber <= line("$")
      exe ":".linenumber
      let linelength  = virtcol("$")
      if maxlength < linelength
        let maxlength = linelength
        let longestline = linenumber
      endif
      let linenumber  = linenumber+1
    endwhile

    if maxlength > 90
        let maxlength = 90
    endif

    " Add 3 for line numbers
    return maxlength + 3
endfunction

command! -complete=file -nargs=* Tabedit call Tabedit(<f-args>)
function! Tabedit(...)
  let t = tabpagenr()
  let i = 0
  for f in a:000
    for g in glob(f, 0, 1)
      exe "tabedit " . fnameescape(g)
      let i = i + 1
    endfor
  endfor
  if i
    exe "tabn " . (t + 1)
  endif
endfunction


" Custom tabs to only show file name
set tabline=%!MyTabLine()

function MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999XX'
  endif

  return s
endfunction

function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let label =  bufname(buflist[winnr - 1])
  return fnamemodify(label, ":t")
endfunction
