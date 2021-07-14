source $HOME/.config/nvim/settings/plugins.vim
source $HOME/.config/nvim/settings/base.vim
source $HOME/.config/nvim/settings/appearance.vim
source $HOME/.config/nvim/settings/functions.vim
source $HOME/.config/nvim/settings/mappings.vim
source $HOME/.config/nvim/settings/aucommands.vim
source $HOME/.config/nvim/settings/abbreviations.vim

lua << EOF
local nvim_lsp = require('lspconfig')

require 'lspconfig'.pyright.setup{}
require 'lspconfig'.bashls.setup{}
require 'lspconfig'.ccls.setup{}
EOF

" vim: foldmethod=marker
