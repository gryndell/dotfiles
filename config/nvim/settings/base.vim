" ┏┓ ┏━┓┏━┓┏━╸   ┏━┓┏━╸╺┳╸╺┳╸╻┏┓╻┏━╸┏━┓
" ┣┻┓┣━┫┗━┓┣╸    ┗━┓┣╸  ┃  ┃ ┃┃┗┫┃╺┓┗━┓
" ┗━┛╹ ╹┗━┛┗━╸   ┗━┛┗━╸ ╹  ╹ ╹╹ ╹┗━┛┗━┛
" Base Settings {{{

syntax enable           " Switch syntax highlighting on
set hidden              " Required to keep multiple buffers open
set wrap                " Display long lines as just one line
set encoding=utf-8      " The encoding displayed
set fileencoding=utf-8  " Encoding written to file
set pumheight=10        " Makes popup menu smaller
set ruler               " Show cursor position all the time
set cmdheight=2         " More space for displaying messages
set iskeyword+=-        " treat '-' separated words as word text objects"
set mouse=a             " Enable the mouse
" Better splits (new windows appear to the right). Would also use splitbelow,
" but it makes help windows split below too.
set splitright          " Vertical splits go to the right
set termguicolors       " Use gui colors in terminal
set conceallevel=0      " Set conceallevel to 0: No concealed characters
set tabstop=4           " Insert 4 spaces for a tabs
set shiftwidth=4        " Change number of space characters for indentation
set softtabstop=4       " 'feels like' tabs
set smarttab            " Makes tabbing smarter/adaptive
set expandtab           " Convert tabs to spaces
set smartindent         " Makes indenting smart
set autoindent          " Autoinserts indents
set laststatus=2        " Always show status line
set showtabline=2       " Always show tab line
set number              " Show line numbers
set relativenumber      " Show relative line numbers
set cursorline          " Highlight the current line
set cursorcolumn        " Highlight the current column
set background=dark     " Dark background
set nobackup            " No backup files (default)
set nowritebackup       " Do not backup before overwriting a file
set updatetime=300      " Faster completion
set timeout             " Wait incase last key is part of sequence
set timeoutlen=500      " Time to wait for following key
set ttimeout            " Wait if partial key code arrives TUI
set ttimeoutlen=100     " Time to wait for rest of key code
set formatoptions-=cro  " Stop newline continuation of comments
set clipboard+=unnamedplus  " Use system clipboard
set nocompatible        " Use vim, not vi
set path+=**            " Use fuzzy directory search
set noswapfile          " No swap file
set history=100         " Command history
set showcmd             " Show incomplete commands
set incsearch           " Incremental searching (search as you type)
set hlsearch            " Highlight search matches
set ignorecase          " Ignore case in search
set infercase
set smartcase           " smart case sensitivity in search
set backspace=indent,eol,start  " <BS> can delete eol, indent and start of line
set joinspaces          " Add extra space when joining lines after . or ,
set helplang=en         " Help language
set viewoptions=folds,options,cursor,curdir " Limit what is saved of a view
" Identify trailing whitespace, tabs etc.
set listchars=tab:»-,trail:·,nbsp:␣,extends:→,precedes:←
set list
set fileformat=unix     " Default to Unix text file format
set autoread            " Autoload files that have changed outside of vim
set shortmess+=I        " Don't show intro
set novisualbell        " Prevent visual beeping at every mistype
set wildmode=longest,list,full  " Enhanced command line completion
set wildmenu            " Wild Menu Mode for completion on command line
set lazyredraw          " Do not redraw after each step of a macro
set showmatch           " highlight a matching [{()}]
set tags=tags;          " Tags
set complete+=i,kspell
set completeopt=menuone,longest
set sessionoptions-=options " Session Options
" Set shada
" was -> '100,<50,s10,h
set shada='100,f1,:100,/100,<100,s10,!,h
set belloff=all         " Set bell off
let g:netrw_liststyle=1 " Set file system explorer to use long line listing
" Check if using gui
if has("gui_running")
  " Autoselect
  set guioptions=a
  set guifont=Hack\ Nerd\ Font\ Mono\ 16
endif
set runtimepath+=/usr/share/nvim/site
" Base Settings }}}

" vim: foldmethod=marker
