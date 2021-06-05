syntax on
colorscheme elflord

set number
set autoindent

set tabstop=4
set shiftwidth=4

set wrap
set linebreak

set nobackup
set noswapfile

set encoding=utf-8
set fileencodings=utf8

set ignorecase
set smartcase

let g:netrw_banner = 0
let g:netrw_liststyle = 3

function! Tabline() abort
    let l:line = ''
    let l:current = tabpagenr()
    for l:i in range(1, tabpagenr('$'))
        if l:i == l:current
            let l:line .= '%#TabLineSel#'
        else
            let l:line .= '%#TabLine#'
        endif
        let l:label = fnamemodify(
            \ bufname(tabpagebuflist(l:i)[tabpagewinnr(l:i) - 1]),
            \ ':t'
        \ )
        let l:line .= '%' . i . 'T'
        let l:line .= l:label . '  '
    endfor
    let l:line .= '%#TabLineFill#'
    let l:line .= '%T' " Ends mouse click target region(s).
    return l:line
endfunction

set tabline=%!Tabline()