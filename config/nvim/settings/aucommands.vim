" ┏━┓╻ ╻╺┳╸┏━┓   ┏━╸┏━┓┏┳┓┏┳┓┏━┓┏┓╻╺┳┓┏━┓
" ┣━┫┃ ┃ ┃ ┃ ┃   ┃  ┃ ┃┃┃┃┃┃┃┣━┫┃┗┫ ┃┃┗━┓
" ╹ ╹┗━┛ ╹ ┗━┛   ┗━╸┗━┛╹ ╹╹ ╹╹ ╹╹ ╹╺┻┛┗━┛
" Auto Commands {{{
" jump to last cursor
augroup jump_group
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
augroup end

" Strip trailing whitespace before writing to file
augroup write_group
  autocmd!
  autocmd BufWritePre * call StripTrailingWhitespace()
augroup end

" Settings for particular file formats
augroup file_types
  autocmd!
  " Spelling etc.
  autocmd FileType tex,pandoc,text
    \ setlocal spell spelllang=en_au
  autocmd FileType tex,pandoc,text
    \ setlocal spellfile=~/.config/nvim/spell/en.utf-8.add
  autocmd FileType tex,pandoc,text
    \ setlocal spellfile+=/.config/nvim/spell/jargon.utf-8.add
  autocmd FileType tex,pandoc,text
    \ setlocal dictionary+=/usr/share/dict/british-english
  autocmd FileType tex,pandoc,text setlocal thesaurus+=~/mthesaur.txt
  autocmd FileType tex,pandoc,text setlocal complete+=i,kspell

  " Text settings
  autocmd FileType tex,text,markdown,pandoc
    \ setlocal textwidth=79 wrap shiftwidth=4 tabstop=4 expandtab
  autocmd FileType gitcommit  setlocal spell textwidth=72
  autocmd FileType sh,zsh,ruby,vim,yaml,html,phtml,xhtml,xml,xsl,css
    \ setlocal textwidth=0 wrap shiftwidth=2 tabstop=2 expandtab
  autocmd FileType ruby       setlocal omnifunc=rubycomplete#Complete
  autocmd FileType html,phtml,xhtml,xml,xsl   :CloseTagEnableBuffer
  autocmd FileType calendar   :IndentLinesDisable
  autocmd FileType csv        :IndentLinesDisable

  " Highlight column 80
  autocmd FileType c,conf,cpp,go,lua,javascript,perl,python,sh,tmux,vim
    \ call matchadd('ColorColumn', '\%80v', 100)
  autocmd FileType html,pandoc,markdown,tex,text
    \ call matchadd('ColorColumn', '\%80v', 100)

  " Wrapping and formatting
  autocmd FileType c,java,lua,python,sh,vim setlocal formatoptions=tcqnj1
  autocmd FileType tex,markdown
    \ setlocal wrap linebreak formatoptions=tcqn
  autocmd FileType text,pandoc
    \ setlocal wrap linebreak formatoptions=tcqn
  autocmd FileType markdown,nroff,pandoc,tex,text   setlocal formatprg=par\ -w79
  autocmd FileType c,cpp,javascript,lua,rust,sh,vim setlocal cindent

  " Fold Methods
  autocmd FileType markdown setlocal foldmethod=expr
  autocmd FileType markdown xnoremap <leader><bslash> :EasyAlign*<bar><cr>
  autocmd FileType lua,python,sh    setlocal foldmethod=indent
  autocmd FileType c,cpp,java,pandoc,go    setlocal foldmethod=syntax
  autocmd FileType sh,vim   setlocal foldmethod=marker
  " Comment out lines/sections in various file types
  autocmd FileType python     nnoremap <buffer> <leader>c I# <esc>
  autocmd FileType tmux,conf  nnoremap <buffer> <leader>c I# <esc>
  autocmd FileType c
    \ vnoremap <buffer> <leader>c <esc>`>a*/<esc>`<i/*<esc>
  autocmd FileType cpp
    \ vnoremap <buffer> <leader>c <esc>`>a*/<esc>`<i/*<esc>
  autocmd FileType vim        nnoremap <buffer> <leader>c I" <esc>
  autocmd BufRead,BufNewFile .Xresources nnoremap <buffer> <leader>c I! <esc>
  autocmd BufRead,BufNewFile .Xresources nnoremap <buffer> gcc I! <esc>
  autocmd BufRead,BufNewFile .Xresources
    \ nnoremap <CR><buffer> <leader>c :s/^/! /<cr>

  " Auto indent HTML when reading/writing
  autocmd BufWritePre,BufRead *.html :normal! m'gg=G`'

  " Settings for specific files
  autocmd BufRead,BufNewFile *.spv setlocal ft=php
  autocmd BufRead,BufNewFile *.md  setlocal ft=pandoc
  autocmd BufRead,BufNewFile *.p   setlocal ft=progress
  autocmd BufRead,BufNewFile *.tsv setlocal ft=csv
  autocmd BufRead,BufNewFile *.h   setlocal ft=c
  autocmd BufRead,BufNewFile *.tsv
    \ setlocal shiftwidth=20 tabstop=20 softtabstop=20 noexpandtab
  autocmd BufRead,BufNewFile *.ms,*.me,*.mom setlocal ft=nroff
  autocmd BufRead,BufNewFile *.c,*.py,*.js,*.java,*.vim,*rc
    \ run :IndentLinesEnable<cr>
  " autocmd BufWritePost       *.c,*.py,*.js,*.java silent! !ctags -R &
  autocmd BufRead,BufNewFile Makefile
    \ setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab
  autocmd BufRead,BufNewFile init.vim
    \ setlocal textwidth=0 shiftwidth=2 tabstop=2 expandtab
  autocmd BufRead,BufNewFile *.wiki run :nunmap <buffer> o<cr>
  autocmd FileType crontab setlocal backupcopy=yes
  " Check file in shellcheck
  autocmd FileType sh nnoremap <silent> <leader>s :!clear && shellcheck %<cr>

  " Run xrdb whenever .Xresources is updated
  autocmd BufWritePost ~/.Xresources silent! !xrdb %
augroup end

" Highlight words to avoid in tech writing
" http://css-tricks.com/words-avoid-educational-writing/
augroup tech_words
  autocmd!
  autocmd BufWinEnter *.tex,*.pandoc,*.md highlight TechWordsToAvoid
  \ guibg=red
  \ guifg=white
  autocmd BufWinEnter *.tex,*.pandoc,*.md match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however,\|so,\|easy/
  autocmd InsertEnter *.tex,*.pandoc,*.md match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however,\|so,\|easy/
  autocmd InsertLeave *.tex,*.pandoc,*.md match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however,\|so,\|easy/
  autocmd BufWinLeave * call clearmatches()
augroup end

" Save folds etc.
augroup view_group
  autocmd!
  autocmd VimEnter * ++nested colorscheme enfocado
  autocmd BufWinLeave *.* silent! mkview!
  autocmd BufWinEnter *.* silent! loadview
  autocmd BufWinLeave config mkview!
  autocmd BufWinEnter config silent! loadview
  autocmd BufWinLeave .Xresources mkview!
  autocmd BufWinEnter .Xresources silent! loadview
  autocmd BufWinLeave init.vim mkview!
  autocmd BufWinEnter init.vim silent! loadview
augroup end

augroup cursor_highlight
  autocmd!
  autocmd WinEnter * set cursorline
  autocmd WinEnter * set cursorcolumn
  autocmd WinLeave * set nocursorline
  autocmd WinLeave * set nocursorcolumn
augroup END

" Goyo.Limelight integration
augroup Goyo
  autocmd! user GoyoEnter Limelight
  autocmd! user GoyoLeave Limelight!
augroup END

" Terminal fix for ACP
augroup Terminal
  autocmd BufEnter,TermOpen term://* AcpDisable
  autocmd BufLeave term://* AcpEnable
augroup END

" Auto Commands }}}

" vim: foldmethod=marker
