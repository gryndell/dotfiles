" ┏┳┓┏━┓┏━┓┏━┓╻┏┓╻┏━╸┏━┓
" ┃┃┃┣━┫┣━┛┣━┛┃┃┗┫┃╺┓┗━┓
" ╹ ╹╹ ╹╹  ╹  ╹╹ ╹┗━┛┗━┛
" Mappings {{{
" Set leader
let mapleader = "\<space>"

" Terminal Vertical
nnoremap <silent> <leader>tv :vertical terminal<cr>
nnoremap <silent> <leader>th :terminal<cr>

" Command to use sudo when needed
cnoremap <silent> w!! %!sudo tee > /dev/null %

" File System Explorer (in horizontal split; called a vertical split in vim)
nnoremap <silent> <leader>. :Vexplore<cr>:vertical-resize 28<cr>

" List buffers
nnoremap <silent> <leader>yt :ls<cr>

" Delete all buffers (runs the delete buffer command on all open buffers)
nnoremap <silent> <leader>yd :bufdo bd<cr>

" Make handling vertical/linear Vim windows easier
nnoremap <silent> <leader>w- <c-w>-
nnoremap <silent> <leader>w+ <c-w>+
nnoremap <silent> <leader>w] <c-w>_
nnoremap <silent> <leader>w[ <c-w>=

" Turn off highlight search
nnoremap <silent> <leader>u :nohls<cr>

" Disable arrow movement, move between windows instead
nnoremap <silent> <up>    <c-w>k
nnoremap <silent> <down>  <c-w>j
nnoremap <silent> <left>  <c-w>h
nnoremap <silent> <right> <c-w>l
nnoremap <silent> <c-up>    :resize -1<cr>
nnoremap <silent> <c-down>  :resize +1<cr>
nnoremap <silent> <c-left>  :vertical resize -1<cr>
nnoremap <silent> <c-right> :vertical resize +1<cr>

" Move lines vertically in visual mode
xnoremap <silent> K :call Move_Up()<cr>
xnoremap <silent> J :call Move_Down()<cr>

" Move lines horizontally in visual mode
xnoremap <silent> <space> :s/^/ /<cr>:nohls<cr>gv
xnoremap <silent> <bs>    :s/^ //<cr>:nohls<cr>gv

" Preserve selection when indenting in visual mode
xnoremap <silent> > >gv
xnoremap <silent> < <gv

" switch buffer
nnoremap <c-PageDown> :bn!<cr>
nnoremap <c-PageUp> :bp!<cr>
nnoremap <silent> <c-j> :bn!<cr>
nnoremap <silent> <c-k> :bp!<cr>

" <F5> to insert date
nnoremap <silent> <f4> "=strftime('%H:%M')<cr>p
inoremap <silent> <f4> <c-r>=strftime('%H:%M')<cr>
nnoremap <silent> <f5> "=strftime('%F')<cr>p
inoremap <silent> <f5> <c-r>=strftime('%F')<cr>

" <F6> to Toggle Undotree
nnoremap <silent> <f6> :UndotreeToggle<cr>

" Calendar
nnoremap <silent> <leader>y :Calendar -view=year<cr>
nnoremap <silent> <leader>d :Calendar -view=day<cr>
nnoremap <silent> <leader>k :Calendar -view=clock<cr>

" (Temporarily) make Edifact document easier to read
nnoremap <leader>E :set nospell<cr>:%s/\v\~/\r/g<cr>

" Rename Leadtec EDI files to remove trailing part
nnoremap <leader>L :e rename.txt<cr>:r !ls Leadtec_*.txt.*<cr>:%s/\v(Leadtec_.*\.txt)\..*/mv & \1/<cr>:w !sh<cr>

" Quotes around
nnoremap <silent> <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <silent> <leader>' viw<esc>a'<esc>bi'<esc>lel
vnoremap <silent> <leader>" <esc>`>a"<esc>`<i"<esc>
vnoremap <silent> <leader>' <esc>`>a'<esc>`<i'<esc>

" Miscellaneous mappings
" Run fuzzy finder FZF
nnoremap <silent> <c-p> :<c-u>FZF<cr>

" Easy return to normal mode
inoremap <silent> jk <esc>

" Toggle number settings
nnoremap <silent> <leader>n :call ToggleNumber()<cr>

" Run SmartHome with Home key
nnoremap <expr> <silent> <Home> SmartHome()
imap <silent> <Home> <C-O><Home>

" Toggle folds
nnoremap <silent> <f7> za
" Toggle all folds
nnoremap <silent> <f8> :call ToggleFolded()<cr>

" Toggle Conceallevel
nnoremap <silent> <f9> :call ToggleConceal()<cr>

" Very Magic - no longer needed because because of wincent/loupe
" nnoremap / /\v
" vnoremap / /\v
" cnoremap %s/ %s/\v

" Edit files in current directory
nnoremap <leader>ew :e <c-r>=expand("%:p:h") . "/"<cr>
nnoremap <leader>es :sp <c-r>=expand("%:p:h") . "/" <cr>
nnoremap <leader>ev :vsp <c-r>=expand("%:p:h") . "/" <cr>
nnoremap <leader>et :tabe <c-r>=expand("%:p:h") . "/" <cr>

" Execute the current line
nnoremap <silent> <leader>x _y$:<c-r>"<cr>

" Fix Vimwiki mappings
nnoremap <silent> <leader>f <Plug>VimwikiFollowLink
nnoremap <silent> <leader>b <Plug>VimwikiGoBackLink

" Toggle spelling
nnoremap <silent> <leader>o :setlocal spell!<cr>

" Auto correct last spelling error
nnoremap <leader>ac :call AutoCorrect()<cr>

" Repeat last find+operation
nnoremap <silent> <leader>r @='n.'<cr>

" Ale Mappings
" Mappings in style of unimpaired-next
nnoremap <silent> [W <Plug>(ale_first)
nnoremap <silent> [w <Plug>(ale_previous)
nnoremap <silent> ]w <Plug>(ale_next)
nnoremap <silent> ]W <Plug>(ale_last)
" Mappings }}}

" vim: foldmethod=marker
