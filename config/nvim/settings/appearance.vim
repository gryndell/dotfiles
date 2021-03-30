" Theme
colorscheme darkspace
let g:darkspace_italics=1
" " Make transparent if terminal, black if gui
if has("gui_running")
  highlight Normal guibg=black
else
  highlight Normal guibg=NONE
endif
highlight Comment gui=italic

" Mark cursor line and column bold
highlight CursorLine gui=bold guibg=NONE
highlight CursorColumn gui=bold guibg=NONE

" Set character for indent lines
let g:indentLine_char = '│'

" Show breaks
let g:showbreak = '→ '

" Fill Characters
if has('folding')
  if has('windows')
    set fillchars=vert:┃
  endif
  set fillchars=fold:-
  " Folding details
  highlight folded guibg=NONE guifg=darkgrey guibg=NONE guifg=darkgrey
endif

" vim: foldmethod=marker
