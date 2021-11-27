" ┏━┓╻  ╻ ╻┏━╸╻┏┓╻┏━┓
" ┣━┛┃  ┃ ┃┃╺┓┃┃┗┫┗━┓
" ╹  ┗━╸┗━┛┗━┛╹╹ ╹┗━┛

" Enable filetype-specific plugins and indenting
filetype plugin indent on

call plug#begin('~/.local/share/nvim/site/pack')

" Various plugins
Plug 'vim-scripts/AutoComplPop' " Auto Completion - Lightweight
" Plug 'shougo/deoplete.nvim' " Auto Completion
Plug 'tpope/vim-commentary' " Shortcuts for comments
" Abolish: Example to swap the words "man" and "dog":
" :%S/{man,dog}/{dog,man}/g
Plug 'tpope/vim-abolish' " Fancy Substitutions
Plug 'tpope/vim-surround' " Wrap a selection with pairs
Plug 'tpope/vim-vinegar' " Smarter netrw
Plug 'tpope/vim-endwise' " Automatically add end constructs
Plug 'tpope/vim-eunuch' " Unix shell command helpers
Plug 'junegunn/fzf' " Advanced fuzzy finder
Plug 'junegunn/limelight.vim' " Highlight current paragraph
Plug 'junegunn/goyo.vim' " Distraction-free editing
Plug 'junegunn/vim-easy-align' " Easy alignment of e.g., markdown tables
Plug 'kshenoy/vim-signature' " Place, toggle and display marks
Plug 'jiangmiao/auto-pairs' " Insert or delete brackets, parens, quotes in pair
Plug 'itchyny/calendar.vim' " A calendar application for Vim
Plug 'lervag/vimtex' " LaTeX plugin
Plug 'dense-analysis/ale' " Advanced Linter Engine
Plug 'Yggdroot/indentLine' " Display thin vertical lines at indent levels
Plug 'chrisbra/csv.vim' " Working with CSV files
Plug 'wincent/loupe' " Enhanced search
Plug 'wincent/terminus' " Enhanced terminal support
Plug 'SirVer/ultisnips' " Snippets engine
Plug 'honza/vim-snippets' " Snippets for various languages
Plug 'davidhalter/jedi-vim' " Autocompletion for Python
Plug 'vim-ruby/vim-ruby' " Ruby configuration etc.
Plug 'freitass/todo.txt-vim' " Syntax highlighting for todo.txt files
Plug 'mbbill/undotree' " Undo tree visualisation
Plug 'alvan/vim-closetag' " Automatically close tags in html
" Plug 'mboughaba/i3config.vim' " i3 config syntax
Plug 'rust-lang/rust.vim' " Configuration for Rust
Plug 'cespare/vim-toml' " Syntax for TOML
Plug 'tommcdo/vim-lion' " Align text around a character
Plug 'vim-pandoc/vim-pandoc' " Pandoc integration
Plug 'vim-pandoc/vim-pandoc-syntax' " Pandoc syntax
Plug 'dhruvasagar/vim-table-mode' " Easy tables
Plug 'gabrielelana/vim-markdown' " Better Vim Markdown syntax highlighting
Plug 'neovim/nvim-lspconfig' " LSP Configuration

" " Dart/Flutter
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'natebosch/dartlang-snippets'
Plug 'thosakwe/vim-flutter'

" " Use Ranger instead of netrw
" Plug 'kevinhwang91/rnvimr', { 'do': 'make sync' }

" Use nnn as file picker
Plug 'luukvbaal/nnn.nvim'

" Aesthetics plugins
Plug 'vim-airline/vim-airline' " Fancy status/tabline
Plug 'vim-airline/vim-airline-themes' " Themes for airline
Plug 'joshdick/onedark.vim' " OneDark colorscheme
Plug 'morhetz/gruvbox' " Gruvbox colorscheme
Plug 'yuqio/vim-darkspace' " Darkspace colorscheme
Plug 'ryanoasis/vim-devicons' " Vim Dev Icons (nerdfont glyphs)
Plug 'wuelnerdotexe/vim-enfocado' " enfocado colorscheme
" Plug 'prettier/vim-prettier', { 'do': 'npm install' }

"Initialize plugin system
call plug#end()

" Deoplete Settings {{{
" Enable deoplete at startup
" let g:deoplete#enable_at_startup = 1
" Deoplete Settings }}}:w

" Airline Settings {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#ale#enabled = 1
let g:airline_theme='enfocado'
let g:airline_left_sep=''
let g:airline_left_alt_sep=' '
let g:airline_right_sep=''
let g:airline_right_alt_sep=' '
" if !(&term =~ 'xterm-kitty')
"   let g:airline_left_sep='▓▒░'
"   let g:airline_left_alt_sep=' '
"   let g:airline_right_sep='░▒▓'
"   let g:airline_right_alt_sep=' '
" endif
" Airline Settings }}}

" ALE Settings {{{
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign guibg=NONE guifg=red
highlight ALEWarningSign guibg=NONE guifg=yellow
let g:ale_linters_explicit = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 0
let g:ale_linters = {
    \ 'bash': ['shellcheck'],
    \ 'c': ['cc'],
    \ 'cpp': ['cc'],
    \ 'dart': ['dart'],
    \ 'javascript': ['eslint'],
    \ 'markdown': ['mdl', 'writegood', 'proselint'],
    \ 'vimwiki': ['mdl', 'writegood', 'proselint'],
    \ 'pandoc': ['mdl', 'writegood', 'proselint'],
    \ 'python': ['flake8'],
    \ 'sh': ['language_server', 'shellcheck'],
    \ 'rust': ['cargo', 'rls']
    \ }
let g:ale_fixers = {
      \ 'c': ['astyle'],
      \ 'cpp': ['astyle'],
      \ 'dart': ['dartfmt'],
      \ 'python': ['yapf'],
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ }
let g:markdown_mdl_executable = 'mdl'
let g:markdown_mdl_options = ''

" ALE Settings }}}

" Ultisnips Settings {{{
let g:UltisnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltisnipsJumpBackwardTrigger = '<s-tab>'
" Ultisnips Settings }}}

" Limelight Settings {{{
let g:limelight_default_coefficient = 0.8
let g:limelight_priority = -1
" Limelight Settings }}}

" Vim-table-mode Settings {{{
" Markdown-compatible tables with vim-table-mode
let g:table_mode_corner = '|'
" Vim-table-mode Settings }}}

" HTML Settings {{{
let g:html_indent_inctags = "html,body,head,tbody"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
" HTML Settings }}}

" Vim-Pandoc-syntax settings {{{
let g:pandoc#syntax#codeblocks#embeds#langs = [
      \ "awk",
      \ "bash=sh",
      \ "c",
      \ "css",
      \ "go",
      \ "html",
      \ "json=javascript",
      \ "lua",
      \ "markdown",
      \ "php",
      \ "python",
      \ "ruby",
      \ "sql",
      \ "toml",
      \ "vim",
      \ "xml",
      \ "yaml",
      \ "zsh",
      \ ]
" Vim-pandoc-syntax settings }}}

" Connect to google calendar and tasks
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" Ack (uses Ag behind the scenes)
let g:ackprg = 'ag --nogroup --nocolor --column'

if filereadable(glob("init.vim.local"))
  source init.vim.local
endif

" Calendar cyclic view
let g:calendar_cyclic_view = 1

let g:tex_flavor = 'latex'

" lsc
let g:lsc_auto_map = v:true

" " Ranger
" source $HOME/.config/nvim/plug-config/rnvimr.vim

" nnn
lua << EOF
require("nnn").setup({
picker = {
  cmd = "nnn -d",
  style = {
    width = 0.5,    -- width in proportion of viewport
    height = 0.5,   -- height in proportion of viewport
    border = "rounded"   -- border decoration, e.g., "rounded" (:h nvim_open_win)
    },
  },
  replace_netrw = "picker"
})
EOF

" vim: foldmethod=marker
