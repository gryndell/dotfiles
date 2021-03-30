" ┏━┓╻  ╻ ╻┏━╸╻┏┓╻┏━┓
" ┣━┛┃  ┃ ┃┃╺┓┃┃┗┫┗━┓
" ╹  ┗━╸┗━┛┗━┛╹╹ ╹┗━┛

" Enable filetype-specific plugins and indenting
filetype plugin indent on

call plug#begin('~/.local/share/nvim/site/pack')

" Various plugins
Plug 'vim-scripts/AutoComplPop' "
Plug 'shougo/deoplete.nvim' "
Plug 'tpope/vim-commentary' "
" Abolish: Example to swap the words "man" and "dog":
" :%S/{man,dog}/{dog,man}/g
Plug 'tpope/vim-abolish' "
Plug 'tpope/vim-surround' "
Plug 'tpope/vim-vinegar' "
Plug 'tpope/vim-endwise' "
Plug 'tpope/vim-eunuch' "
Plug 'junegunn/fzf' "
Plug 'junegunn/limelight.vim' "
Plug 'junegunn/goyo.vim' "
Plug 'junegunn/vim-easy-align' "
Plug 'kshenoy/vim-signature' "
Plug 'jiangmiao/auto-pairs' "
Plug 'itchyny/calendar.vim' "
Plug 'lervag/vimtex' "
Plug 'dense-analysis/ale' "
Plug 'Yggdroot/indentLine' "
Plug 'vim-utils/vim-man' "
Plug 'chrisbra/csv.vim' "
Plug 'wincent/loupe' "
Plug 'wincent/terminus' "
Plug 'SirVer/ultisnips' "
Plug 'honza/vim-snippets' "
" Plug 'davidhalter/jedi-vim' "
Plug 'vim-ruby/vim-ruby' "
Plug 'freitass/todo.txt-vim' "
Plug 'mbbill/undotree' "
Plug 'alvan/vim-closetag' "
Plug 'mboughaba/i3config.vim' "
Plug 'rust-lang/rust.vim' "
Plug 'cespare/vim-toml' "
Plug 'tommcdo/vim-lion' "

" Aesthetics plugins
Plug 'vim-airline/vim-airline' "
Plug 'vim-airline/vim-airline-themes' "
Plug 'joshdick/onedark.vim' "
Plug 'morhetz/gruvbox' "
Plug 'yuqio/vim-darkspace' "
Plug 'vim-pandoc/vim-pandoc' "
Plug 'vim-pandoc/vim-pandoc-syntax' "
Plug 'dhruvasagar/vim-table-mode' "
Plug 'gabrielelana/vim-markdown' "
Plug 'ryanoasis/vim-devicons' "

"Initialize plugin system
call plug#end()

" Deoplete Settings {{{
" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1
" Deoplete Settings }}}:w

" Airline Settings {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#ale#enabled = 1
let g:airline_theme='darkspace'
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
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_linters = {
\ 'bash': ['shellcheck'],
\ 'c': ['ccls'],
\ 'cpp': ['ccls'],
\ 'javascript': ['eslint'],
\ 'markdown': ['mdl', 'writegood', 'proselint'],
\ 'vimwiki': ['mdl', 'writegood', 'proselint'],
\ 'pandoc': ['mdl', 'writegood', 'proselint'],
\ 'sh': ['language_server', 'shellcheck']
\ }
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'],}
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

" vim: foldmethod=marker
