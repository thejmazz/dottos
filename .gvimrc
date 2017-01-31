" set guifont=Meslo\ LG\ M\ DZ\ for\ Powerline:h15

set macligatures
set guifont=Fira\ Code:h18
set linespace=4
set guioptions-=r

let g:one_allow_italics = 1
let g:airline_theme='one'
colorscheme one

highlight ExtraWhitespace ctermbg=red guibg=#be5046
highlight VertSplit guibg=#282b34 guifg=#282b34

set vb t_vb=

" autocmd! GUIEnter * set vb t_vb=
" autocmd! GUIEnter * NERDTreeClose

" loses syntax colors :(
" autocmd! GUIEnter * OpenSession

" autocmd GUIEnter * OpenSession | set vb t_vb=

autocmd GUIEnter call Prepare()

function Prepare()
    # Disable bell
    set vc t_vb=

    OpenSession
endfunction
