" ┏━┓╻  ╻ ╻┏━╸╻┏┓╻┏━┓
" ┣━┛┃  ┃ ┃┃╺┓┃┃┗┫┗━┓
" ╹  ┗━╸┗━┛┗━┛╹╹ ╹┗━┛
" Plugins {{{
" Make sure minpac is loaded
packadd minpac
packadd! matchit

" Initialise minpac
call minpac#init()

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'}) " Plugin manager

" Various plugins
call minpac#add('ap/vim-buftabline') " Buffers in the tab line
call minpac#add('vimwiki/vimwiki') " Personal wiki
call minpac#add('tpope/vim-scriptease', {'type': 'opt'}) " Help for VimL
call minpac#add('tpope/vim-commentary') " Shortcuts for comments
" Abolish: Example to swap the words "man" and "dog":
" :%S/{man,dog}/{dog,man}/g
call minpac#add('tpope/vim-abolish') " Fancy substitutions
call minpac#add('tpope/vim-surround') " Wrap a selection with pairs
call minpac#add('tpope/vim-dadbod') " Database Connectivity
call minpac#add('tpope/vim-vinegar') " File finder
call minpac#add('tpope/vim-endwise') " Automatically add end constructs
call minpac#add('junegunn/fzf') " Advanced fuzzy finder
call minpac#add('junegunn/goyo.vim') " Distraction-free editing
call minpac#add('kshenoy/vim-signature') " Place, toggle and display marks
call minpac#add('vim-scripts/AutoComplPop') " Autocomplete with pop-up
call minpac#add('jiangmiao/auto-pairs') " Insert or delete brackets, parens, quotes in pair
call minpac#add('itchyny/calendar.vim') " A calendar application for Vim
call minpac#add('lervag/vimtex') " Latex plugin
call minpac#add('w0rp/ale') " Advanced Linter Engine
call minpac#add('Yggdroot/indentLine') " Display thin vertical lines at indent levels
call minpac#add('vim-utils/vim-man') " Display man pages
call minpac#add('chrisbra/csv.vim') " Working with CSV files
call minpac#add('wincent/loupe') " Enhanced search
call minpac#add('wincent/terminus') " Enhanced terminal support
call minpac#add('SirVer/ultisnips') " Snippets engine
call minpac#add('honza/vim-snippets') " Snippets for various languages
call minpac#add('davidhalter/jedi-vim') " Autocompletion for Python
call minpac#add('vim-ruby/vim-ruby') " Ruby Configuration etc
call minpac#add('freitass/todo.txt-vim') " Syntax highlighting for todo.txt files
call minpac#add('mbbill/undotree') " Undo tree visualisation
call minpac#add('alvan/vim-closetag') " Automatically close tags in html
call minpac#add('mboughaba/i3config.vim') " i3 config sytax

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
" Plugins }}}

" ┏┓ ┏━┓┏━┓┏━╸   ┏━┓┏━╸╺┳╸╺┳╸╻┏┓╻┏━╸┏━┓
" ┣┻┓┣━┫┗━┓┣╸    ┗━┓┣╸  ┃  ┃ ┃┃┗┫┃╺┓┗━┓
" ┗━┛╹ ╹┗━┛┗━╸   ┗━┛┗━╸ ╹  ╹ ╹╹ ╹┗━┛┗━┛
" Base Settings {{{
" Check if using gvim
if has("gui_running")
  " Autoselect
  set guioptions=a
  set guifont=Hack\ Nerd\ Font\ Mono\ 16
endif

" Use vim, not vi
set nocompatible

" Use fuzzy directory search
set path+=**

" Enable filetype-specific plugins and indenting
filetype plugin indent on

" Switch syntax highlighting on
syntax on

" No backup files (default)
set nobackup

" Write backup (default)
set writebackup

" No swap file
set noswapfile

" Command history
set history=100

" Show incomplete commands
set showcmd

" Incremental searching (search as you type)
set incsearch

" Highlight search matches
set hlsearch

" Ignore case in search
set ignorecase
set infercase

" Make sure any searches /searchPhrase doesn't need the \c escape character
set smartcase

" Allow backspace to delete end of line, indent and start of line characters
set backspace=indent,eol,start

" Convert tabs to spaces
set expandtab

" Set tab size in spaces (this is for manual indenting)
set tabstop=4

" The number of spaces inserted for a tab (used for auto indenting)
set shiftwidth=4

" SmartTab: <Tab> in front of a line inserts blanks according to
" 'shiftwidth'.  'tabstop' or 'softtabstop' is used in other places.  A
" <BS> will delete a 'shiftwidth' worth of space at the start of the
" line.
set smarttab

" Add extra space when joing lines after a . or ,
set joinspaces

" Turn on line numbers and show relative line numbers
set number relativenumber

" Help language
set helplang=en

" Format sensibly for numbered lists.
" Remove comment leader when joining comment lines.
set formatoptions+=nj1

" Limit what is saved of a view
set viewoptions=folds,options,cursor,curdir

" Identify trailing whitespace and any tabs
set listchars=tab:»-,trail:·,nbsp:␣,extends:→,precedes:←
set list

" Get rid of the delay when pressing O (for example)
set timeout ttimeout timeoutlen=1000 ttimeoutlen=100

" UTF encoding
set encoding=utf-8 fileencodings=utf-8,latin1,ucs-bom,default

" Default to Unix text file format
set fileformat=unix

" Autoload files that have changed outside of vim
set autoread

" Use system clipboard
set clipboard+=unnamed

" Don't show intro
set shortmess+=I

" Better splits (new windows appear to the right). Would also use splitbelow,
" but it makes help windows split below too.
set splitright

" Highlight the current line
set cursorline

" Ensure Vim doesn't beep at you every time you make a mistype
set novisualbell

" Enhanced command line completion
set wildmode=longest,list,full
set wildmenu

" redraw only when we need to (i.e. don't redraw when executing a macro)
set lazyredraw

" highlight a matching [{()}] when cursor is placed on start/end character
set showmatch

" Theme
set background=dark
colorscheme dracula
" colorscheme afterglow
" colorscheme firesparks-256
" colorscheme oceanblack256
" " Make transparent if terminal, black if gui
if has("gui_running")
  highlight Normal guibg=black
else
  highlight Normal ctermbg=NONE
endif
" highlight Terminal ctermbg=NONE
" ColorColumn highlight
highlight ColorColumn ctermbg=darkgrey
" StatusLine
highlight StatusLine   cterm=NONE guibg=darkgrey
highlight StatusLineNC cterm=NONE guibg=black
highlight SL_Path     ctermbg=darkgrey ctermfg=lightgrey
highlight SL_Path_Sep ctermfg=darkgrey ctermbg=grey
highlight SL_Type     ctermbg=grey     ctermfg=black
highlight SL_Type_Sep ctermbg=darkgrey ctermfg=grey
highlight SL_Pos      ctermbg=darkgrey ctermfg=lightgrey

" Set autoindent
set autoindent
set smartindent

" Tags
set tags=tags;

" Session Options
set sessionoptions-=options

" Set viminfo
set viminfo='100,f1,:100,/100,<100,s10,!,h
" was -> '100,<50,s10,h

" Set bell off
set belloff=all

" Set conceallevel to 0: No concealed characters
set conceallevel=0

" Enable the mouse
set mouse=a

" Set file system explorer to use long line listing
let g:netrw_liststyle=1

" HTML
let g:html_indent_inctags = "html,body,head,tbody"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" Set character for indent lines
let g:indentLine_char = '│'

" Show breaks
let g:showbreak = '→ '

" Connect to google calendar and tasks
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" Code block syntax highlighting in Markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" Ack (uses Ag behind the scenes)
let g:ackprg = 'ag --nogroup --nocolor --column'

" Git authorisation settings
let g:github_user = $GITHUB_USER
let g:github_token = $GITHUB_TOKEN
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
" Related plugins:
" https://github.com/mattn/webapi-vim
" https://github.com/vim-scripts/Gist.vim
" https://github.com/tpope/vim-fugitive

" Vimtex settings
let g:tex_flavor='latex'
let g:vimtex_view_enabled=1
let g:vimtex_view_automatic=1
" Check that we are running in X
if has_key(environ(), 'XDG_SESSION_PATH')
  let g:vimtex_view_method='zathura'
endif
let g:vimtex_quickfix_mode=1
let g:vimtex_fold_types = {
    \ 'preamble': {'enabled': 1},
    \ 'sections': {'enabled': 1},
    \ 'comments': {'enabled': 1},
    \ 'markers': {'enabled': 1},
    \ 'envs': {'enabled': 1},
    \ 'env_options': {'enabled': 1},
    \ 'cmd_single': {'enabled': 1},
    \ 'cmd_single_opt': {'enabled': 1},
    \ 'cmd_multi': {'enabled': 1},
    \ 'cmd_addplot': {'enabled': 1}
    \}
let g:vimtex_compiler_latexmk = {
    \ 'backend' : 'jobs',
    \ 'background' : 1,
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 0,
    \ 'executable' : 'latexmk',
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
" let g:tex_conceal='abdmg'

" ALE: Asynchronous Linter Engine
" For Javascript files, use `eslint` (and only eslint)
let g:ale_linters = {
      \   'javascript': ['eslint'],
      \}

" debug compilation in C
let $CFLAGS='-Wall -g'
" "release" compilation in C++
let $CXXFLAGS='-Wall -O3 -DNDEBUG -march=native'

if filereadable(glob(".vimrc.local"))
  source .vimrc.local
endif

" Vimwiki
let g:vimwiki_folding = 'syntax'
let g:vimwiki_hl_headers = 1
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_listsyms = ' ○◐●✔'
let g:vimwiki_list = [{'path': '~/vimwiki/', 'auto_toc': 1, 'index': 'index', 'path_html': '~/vimwiki_html', 'auto_export': 1}]
highlight VimwikiHeader1 ctermfg=red
highlight VimwikiHeader2 ctermfg=yellow
highlight VimwikiHeader3 ctermfg=green
highlight VimwikiHeader4 ctermfg=cyan
highlight VimwikiHeader5 ctermfg=blue
highlight VimwikiHeader6 ctermfg=magenta

" Fill Characters
if has('folding')
  if has('windows')
    set fillchars=vert:┃
  endif
  set fillchars=fold:↕
  " Folding details
  highlight folded ctermbg=NONE ctermfg=darkgrey
endif

" Calendar cyclic view
let g:calendar_cyclic_view = 1

" Ultisnips settings
let g:UltisnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltisnipsJumpBackwardTrigger = '<s-tab>'

" Some useful glyphs
let g:line_vertical = '│'
let g:slant_right   = '╱'
let g:slant_left    = '╲'
let g:chevron_sr    = ''
let g:chevron_sl    = ''
let g:chevron_or    = ''
let g:chevron_ol    = ''
let g:logo_ruby     = ''
let g:logo_java     = ''
let g:logo_js       = ''
let g:logo_md       = ''
let g:logo_cpp      = ''
let g:logo_c        = ''
let g:logo_hask     = ''
let g:logo_lua      = ''
let g:logo_go       = ''
let g:logo_html     = ''
let g:logo_python   = ''
let g:logo_php      = ''
let g:logo_code     = ''
let g:logo_vim      = ''
let g:logo_win      = ''
let g:logo_apple    = ''
let g:logo_linux    = ''

" Base Settings }}}

" ┏━┓╺┳╸┏━┓╺┳╸╻ ╻┏━┓   ╻  ╻┏┓╻┏━╸
" ┗━┓ ┃ ┣━┫ ┃ ┃ ┃┗━┓   ┃  ┃┃┗┫┣╸
" ┗━┛ ╹ ╹ ╹ ╹ ┗━┛┗━┛   ┗━╸╹╹ ╹┗━╸
" {{{ Status Line
" Set the status line to something useful
set statusline=%#SL_Path#
set statusline+=%F\ %m
set statusline+=%#SL_Path_Sep#
set statusline+=%{g:chevron_sr}
set statusline+=%#SL_Type#
set statusline+=\ %{ShowFileType()}
set statusline+=\ %{ShowFileFormat()}
set statusline+=\ %{&fileencoding}\ %r
set statusline+=%{ShowSpell()}
set statusline+=%=%#SL_Type_Sep#
set statusline+=%{g:chevron_sr}
set statusline+=%#SL_Pos#
set statusline+=\ ℓ:%l/%L\ %c\ (%p%%)\ 0x%04.B
set laststatus=2
set showtabline=2

" }}} Status Line

" ┏━╸╻ ╻┏┓╻┏━╸╺┳╸╻┏━┓┏┓╻┏━┓
" ┣╸ ┃ ┃┃┗┫┃   ┃ ┃┃ ┃┃┗┫┗━┓
" ╹  ┗━┛╹ ╹┗━╸ ╹ ╹┗━┛╹ ╹┗━┛
" Functions {{{
" Toggle numbers
function!ToggleNumber()
  if (&relativenumber == 0 && &number == 0)
    set number
  elseif (&relativenumber == 0 && &number == 1)
    set relativenumber
    set nonumber
  elseif (&relativenumber == 1 && &number == 0)
    set number
  elseif (&relativenumber == 1 && &number == 1)
    set norelativenumber
    set nonumber
  endif
endfunction

function!ToggleConceal()
  if (&conceallevel == 0)
    set conceallevel=1
  elseif (&conceallevel == 1)
    set conceallevel=2
  elseif (&conceallevel == 2)
    set conceallevel=3
  else
    set conceallevel=0
  endif
  echo "Conceal Level is " &conceallevel
endfunction

" Smart Home Key
function! SmartHome()
  let first_nonblank = match(getline('.'), '\S') + 1
  if first_nonblank == 0
    return col('.') + 1 >= col('$') ? '0' : '^'
  endif
  if col('.') == first_nonblank
    return '0'  " if at first nonblank, go to start line
  endif
  return &wrap && wincol() > 1 ? 'g^' : '^'
endfunction

" Toggle Folding Level
function! ToggleFolded()
  if &foldlevel == 0
    normal! zR
  else
    normal! zM
  endif
endfunction

" Strip Trailing Whitespace
function! StripTrailingWhitespace()
  " don't strip on these filetypes
  if &ft =~ 'markdown'
    return
  endif
  if &ft =~ 'make'
    return
  endif
  if &ft =~ 'crontab'
    return
  endif
  if &ft =~ 'diff'
    return
  endif
  if !&binary
    " Save current position
    let l:_save_pos = getpos('.')
    " range all remove trailing whitespace characters
    %s/\s\+$//e
    " Restore position
    call setpos('.', l:_save_pos)
  endif
endfunction

" Reset spelling colours when reading a new buffer
" This works around an issue where the colorscheme is changed by .local.vimrc
function! SetSpellingColors()
  highlight SpellBad cterm=bold ctermfg=white ctermbg=red
  highlight SpellCap cterm=bold ctermfg=red ctermbg=white
endfunction

" Change colourscheme when diffing
function! SetDiffColors()
  highlight DiffAdd     cterm=bold ctermfg=white ctermbg=DarkGreen
  highlight DiffDelete  cterm=bold ctermfg=white ctermbg=DarkGrey
  highlight DiffChange  cterm=bold ctermfg=white ctermbg=DarkBlue
  highlight DiffText    cterm=bold ctermfg=white ctermbg=DarkRed
endfunction

" Visual Move Functions from Drew Neil's vimcasts - http://vimcasts.org/episodes/bubbling-text/
" Modified to check for line-visual mode.
function! Visual()
  return visualmode() ==# 'V'
endfunction
" Move Up
function! Move_Up() abort range
  let l:at_top=a:firstline == 1
  if Visual() && !l:at_top
    '<,'>move '<-2
    call feedkeys('gv=', 'n')
  endif
  call feedkeys('gv', 'n')
endfunction
" Move Down
function! Move_Down() abort range
  let l:at_bottom=a:lastline == line('$')
  if Visual() && !l:at_bottom
    '<,'>move '>+1
    call feedkeys('gv=', 'n')
  endif
  call feedkeys('gv', 'n')
endfunction

" Go to previous spelling error and use first suggestion
function! AutoCorrect()
    normal! ms[s1z=`s
endfunction

" Check for modified
function! CheckModified() abort
  if &modified
    " highlight SL_Path ctermfg=green
    " highlight SL_Type ctermfg=green
    " highlight SL_Pos ctermfg=green
    highlight TabLineSel ctermfg=green
  else
    " highlight SL_Path ctermfg=lightgrey
    " highlight SL_Type ctermfg=black
    " highlight SL_Pos  ctermfg=lightgrey
    highlight TabLineSel ctermfg=lightgrey
  endif
endfunction

" See if Spelling is on
function! ShowSpell()
  if &spell
    return ' [SPELL]'
  else
    return ''
  endif
endfunction

" Get file format
function! ShowFileFormat()
  if &ff == 'dos'
    return g:logo_win
  elseif &ff == 'mac'
    return g:logo_apple
  else
    return g:logo_linux
endfunction

" Show filetype glyph
function! ShowFileType()
  if &ft == 'c'
    return g:logo_c
  elseif &ft == 'cpp'
    return g:logo_cpp
  elseif &ft == 'go'
    return g:logo_go
  elseif &ft == 'haskell'
    return g:logo_hask
  elseif &ft == 'html'
    return g:logo_html
  elseif &ft == 'java'
    return g:logo_java
  elseif &ft == 'javascript'
    return g:logo_js
  elseif &ft == 'lua'
    return g:logo_lua
  elseif &ft == 'markdown'
    return g:logo_md
  elseif &ft == 'php'
    return g:logo_php
  elseif &ft == 'python'
    return g:logo_python
  elseif &ft == 'ruby'
    return g:logo_ruby
  elseif &ft == 'vim'
    return g:logo_vim
  else
    return '[' . &ft . ']'
  endif
endfunction

" Custom tabline WIP
function! MyTabLine()
  let s = ''
  for i in range(bufnr('$'))
    " select the highlighting
    if i + 1 == bufnr('.')
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    let s .= bufname(i)

    if i == bufnr('.')
      let s .= '%#TabChevronSolid#' . g:chevron_sr
    else
      let s .= g:chevron_or
    endif

  endfor

  " after the last tab fill with TabLineFill
  let s .= '%#TabLineFill#'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999Xbuffers'
  endif

  return s
endfunction

" Functions }}}

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

" Command to compile Latex documents
noremap <silent> <f10> :VimtexCompile<cr>

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
nnoremap <c-PageDown> :bn<cr>
nnoremap <c-PageUp> :bp <cr>
nnoremap <silent> <c-j> :bn<cr>
nnoremap <silent> <c-k> :bp<cr>

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

" (Progress/QAD) turn cursor-down trigger into cursor-up trigger
nnoremap <leader>D V/^end<cr>:s/first/last/<cr>gv:s/gt/lt/<cr>gv:s/down/up/<cr>:nohls<cr>

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

" Ale Mappings
" Mappings in style of unimpaired-next
nnoremap <silent> [W <Plug>(ale_first)
nnoremap <silent> [w <Plug>(ale_previous)
nnoremap <silent> ]w <Plug>(ale_next)
nnoremap <silent> ]W <Plug>(ale_last)

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

" " Can be used to do without pairing plugins
" inoremap ( ()<Esc>i
" inoremap { {}<Esc>i
" inoremap {<CR> {<CR>}<Esc>O
" inoremap [ []<Esc>i
" inoremap < <><Esc>i
" inoremap ' ''<Esc>i
" inoremap " ""<Esc>i

" Repeat last find+operation
nnoremap <silent> <leader>r @='n.'<cr>

" Mappings }}}

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
  autocmd FileType tex,vimwiki,text
    \ setlocal spell spelllang=en_au
  autocmd FileType tex,vimwiki,text
    \ setlocal spellfile=~/.vim/spell/en.utf-8.add
  autocmd FileType tex,vimwiki,text
    \ setlocal spellfile+=/.vim/spell/jargon.utf-8.add
  autocmd FileType tex,vimwiki,text
    \ setlocal dictionary+=/usr/share/dict/british-english
  autocmd FileType tex,vimwiki,text setlocal thesaurus+=~/mthesaur.txt
  autocmd FileType tex,vimwiki,text setlocal complete+=,kspell
  autocmd FileType nroff setlocal tw=79 sw=4 wrap
  autocmd FileType nroff :let b:nroff_is_groff=1
  autocmd FileType nroff :let b:nroff_space_errors = 1

  " Text settings
  autocmd FileType tex,vimwiki,text
    \ setlocal textwidth=79 wrap shiftwidth=4 tabstop=4 expandtab
  autocmd FileType gitcommit  setlocal spell textwidth=72
  autocmd FileType sh,ruby
    \ setlocal textwidth=0 shiftwidth=2 tabstop=2 expandtab
  autocmd FileType vim
    \ setlocal textwidth=0 shiftwidth=2 tabstop=2 expandtab
  autocmd FileType javascript
    \ setlocal textwidth=0 shiftwidth=2 tabstop=2 expandtab
  autocmd FileType ruby       setlocal omnifunc=rubycomplete#Complete
  autocmd FileType html,phtml,xhtml,xml,xsl   :CloseTagEnableBuffer
  autocmd FileType calendar   :IndentLinesDisable
  autocmd FileType csv        :IndentLinesDisable
  autocmd FileType html
    \ setlocal textwidth=79 wrap shiftwidth=2 tabstop=2 expandtab

  " Highlight column 80
  autocmd FileType conf,cpp,go,lua
    \ call matchadd('ColorColumn', '\%80v', 100)
  autocmd FileType javascript,c,perl
    \ call matchadd('ColorColumn', '\%80v', 100)
  autocmd FileType python,sh,tmux,vim
    \ call matchadd('ColorColumn', '\%80v', 100)
  autocmd FileType tex,markdown
    \ call matchadd('ColorColumn', '\%80v', 100)
  autocmd FileType text,vimwiki,html,progress
    \ call matchadd('ColorColumn', '\%80v', 100)

  " Wrapping and formatting
  autocmd FileType sh,python,c        setlocal formatoptions=tcq
  autocmd FileType java,lua,vim       setlocal formatoptions=tcq
  autocmd FileType tex,markdown
    \ setlocal wrap linebreak formatoptions=tcqn
  autocmd FileType text,vimwiki
    \ setlocal wrap linebreak formatoptions=tcqn
  autocmd FileType tex,markdown setlocal formatprg="par\ -w79"
  autocmd FileType text,vimwiki       setlocal formatprg="par\ -w79"
  autocmd FileType c,cpp,java,lua     setlocal cindent
  autocmd FileType javascript,sh,vim  setlocal cindent

  " Fold Methods
  autocmd FileType markdown setlocal foldmethod=expr
  autocmd FileType lua,python,sh    setlocal foldmethod=indent
  autocmd FileType c,cpp,java,vimwiki,go    setlocal foldmethod=syntax
  autocmd FileType sh,vim   setlocal foldmethod=marker
  autocmd FileType tex      setlocal foldmethod=expr
  autocmd FileType tex      setlocal foldexpr=vimtex#fold#level(v:lnum)
  autocmd FileType tex      setlocal foldtext=vimtex#fold#text()

  " Comment out lines/sections in various file types
  autocmd FileType javascript nnoremap <buffer> <leader>c I// <esc>
  autocmd FileType python     nnoremap <buffer> <leader>c I# <esc>
  autocmd FileType tmux,conf  nnoremap <buffer> <leader>c I# <esc>
  autocmd FileType c
    \ vnoremap <buffer> <leader>c <esc>`>a*/<esc>`<i/*<esc>
  autocmd FileType cpp
    \ vnoremap <buffer> <leader>c <esc>`>a*/<esc>`<i/*<esc>
  autocmd FileType vim        nnoremap <buffer> <leader>c I" <esc>
  autocmd FileType tex        nnoremap <buffer> <leader>c I% <esc>
  autocmd FileType tex
    \ vnoremap <buffer> <leader>c :s/^/% /<cr>:set nohls<cr>
  autocmd BufRead,BufNewFile .Xresources nnoremap <buffer> <leader>c I! <esc>
  autocmd BufRead,BufNewFile .Xresources nnoremap <buffer> gcc I! <esc>
  autocmd BufRead,BufNewFile .Xresources
    \ nnoremap <CR><buffer> <leader>c :s/^/! /<cr>

  " Auto indent HTML when reading/writing
  autocmd BufWritePre,BufRead *.html :normal! m'gg=G`'

  " Settings for specific files
  autocmd BufRead,BufNewFile *.spv setlocal ft=php
  autocmd BufRead,BufNewFile *.md  setlocal ft=markdown
  autocmd BufRead,BufNewFile *.p   setlocal ft=progress
  autocmd BufRead,BufNewFile *.tsv setlocal ft=csv
  autocmd BufRead,BufNewFile *.h   setlocal ft=c
  autocmd BufRead,BufNewFile *.tsv
    \ setlocal shiftwidth=20 tabstop=20 softtabstop=20 noexpandtab
  autocmd BufRead,BufNewFile *.ms  setlocal ft=nroff
  autocmd BufRead,BufNewFile *.c,*.py,*.js,*.java,*.vim,*rc
    \ run :IndentLinesEnable<cr>
  " autocmd BufWritePost       *.c,*.py,*.js,*.java silent! !ctags -R &
  autocmd BufRead,BufNewFile Makefile
    \ setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab
  autocmd BufRead,BufNewFile .vimrc
    \ setlocal textwidth=0 shiftwidth=2 tabstop=2 expandtab
  autocmd BufRead,BufNewFile *.wiki run :nunmap <buffer> o<cr>
  autocmd FileType crontab setlocal backupcopy=yes
  autocmd FileType vimwiki autocmd BufWritePost <buffer> silent Vimwiki2HTML
  " Check file in shellcheck
  autocmd FileType sh nnoremap <silent> <leader>s :!clear && shellcheck %<cr>
  autocmd Filetype progress setlocal fdm=indent wrap sw=4 ts=4


  " Run xrdb whenever .Xresources is updated
  autocmd BufWritePost ~/.Xresources silent! !xrdb %

  " Settings for Progress
  autocmd FileType progress setlocal textwidth=79
  autocmd FileType progress iabbrev ava available
  autocmd FileType progress iabbrev cha character
  autocmd FileType progress iabbrev dec decimal
  autocmd FileType progress iabbrev def define
  autocmd FileType progress iabbrev fun function
  autocmd FileType progress iabbrev ini initial
  autocmd FileType progress iabbrev inp input
  autocmd FileType progress iabbrev int integer
  autocmd FileType progress iabbrev log logical
  autocmd FileType progress iabbrev mes message
  autocmd FileType progress iabbrev noa no-apply
  autocmd FileType progress iabbrev noe no-error
  autocmd FileType progress iabbrev nol no-lock
  autocmd FileType progress iabbrev nom no-message
  autocmd FileType progress iabbrev nop no-pause
  autocmd FileType progress iabbrev nou no-undo
  autocmd FileType progress iabbrev par parameter
  autocmd FileType progress iabbrev pro procedure
  autocmd FileType progress iabbrev rep repeat
  autocmd FileType progress iabbrev ret return
  autocmd FileType progress iabbrev var variable
  autocmd FileType progress iabbrev do: do:<cr><bs>end.<space>/**<esc>ko
augroup end

" Highlight words to avoid in tech writing
" http://css-tricks.com/words-avoid-educational-writing/
" match TechWordsToAvoid
" /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however\|so,\|easy/
augroup tech_words
  autocmd!
  autocmd BufWinEnter *.tex,*.vimwiki highlight TechWordsToAvoid ctermbg=red
  \ ctermfg=white
  autocmd BufWinEnter *.tex,*.vimwiki match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however,\|so,\|easy/
  autocmd InsertEnter *.tex,*.vimwiki match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however,\|so,\|easy/
  autocmd InsertLeave *.tex,*.vimwiki match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however,\|so,\|easy/
  autocmd BufWinLeave * call clearmatches()
augroup end

" Create a 'scratch buffer' which is a temporary buffer Vim wont ask to save
" http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
" command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
" function! s:RunShellCommand(cmdline)
"   echo a:cmdline
"   let expanded_cmdline = a:cmdline
"   for part in split(a:cmdline, ' ')
"     if part[0] =~ '\v[%#<]'
"       let expanded_part = fnameescape(expand(part))
"       let expanded_cmdline =
"         \ substitute(expanded_cmdline, part, expanded_part, '')
"     endif
"   endfor
"   botright new
"   setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
"   call setline(1, 'You entered:  ' . a:cmdline)
"   call setline(2, 'Expanded Form:  ' .expanded_cmdline)
"   call setline(3,substitute(getline(2),'.','=','g'))
"   execute '$read !'. expanded_cmdline
"   setlocal nomodifiable
"   1
" endfunction

" Save folds etc.
augroup view_group
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent loadview
  autocmd BufWinLeave config mkview
  autocmd BufWinEnter config silent loadview
  autocmd BufWinLeave .Xresources mkview
  autocmd BufWinEnter .Xresources silent loadview
  autocmd BufWinLeave .vimrc mkview
  autocmd BufWinEnter .vimrc silent loadview
augroup end


augroup spelling_colors
  autocmd!
  autocmd BufWinEnter * call SetSpellingColors()
  autocmd BufNewFile * call SetSpellingColors()
  autocmd BufRead * call SetSpellingColors()
  autocmd InsertEnter * call SetSpellingColors()
  autocmd InsertLeave * call SetSpellingColors()
augroup end

augroup diff_colors
  autocmd!
  autocmd FilterWritePre * call SetDiffColors()
augroup end

augroup checkmod
  autocmd!
  autocmd BufWinEnter,BufWritePost,FileWritePost * call CheckModified()
  autocmd TextChanged,TextChangedI,WinEnter * call CheckModified()
augroup end

" Auto Commands }}}

" ┏━┓┏┓ ┏┓ ┏━┓┏━╸╻ ╻╻┏━┓╺┳╸╻┏━┓┏┓╻┏━┓
" ┣━┫┣┻┓┣┻┓┣┳┛┣╸ ┃┏┛┃┣━┫ ┃ ┃┃ ┃┃┗┫┗━┓
" ╹ ╹┗━┛┗━┛╹┗╸┗━╸┗┛ ╹╹ ╹ ╹ ╹┗━┛╹ ╹┗━┛
" Abbreviations {{{
" Accented words
iabbrev voila voilà
iabbrev fete fête
iabbrev hotel hôtel
iabbrev cafe café
iabbrev naive naïve
iabbrev ala à la
iabbrev francais français
iabbrev francaise française
iabbrev decor décor
iabbrev facade façade

" Common typos
iabbrev waht what
iabbrev Waht What
iabbrev teh the
iabbrev Teh The
iabbrev tehn then
iabbrev Tehn Then
iabbrev adn and
iabbrev Adn And
" Abbreviations }}}

" ┏━┓┏━╸┏━┓┏━┓┏━┓┏┓╻┏━┓╻     ╺┳┓┏━╸╺┳╸┏━┓╻╻  ┏━┓
" ┣━┛┣╸ ┣┳┛┗━┓┃ ┃┃┗┫┣━┫┃      ┃┃┣╸  ┃ ┣━┫┃┃  ┗━┓
" ╹  ┗━╸╹┗╸┗━┛┗━┛╹ ╹╹ ╹┗━╸   ╺┻┛┗━╸ ╹ ╹ ╹╹┗━╸┗━┛
" Personal Details {{{
let g:BASH_AuthorName = $BASH_AuthorName
let g:BASH_Email = $BASH_Email
let g:BASH_Company = $BASH_Company
" Personal Details }}}

