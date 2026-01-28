# PATH {{{
if [[ -d "$HOME/bin" ]]; then
  export PATH="$HOME/bin:$PATH"
fi
if [[ -d "$HOME/.local/bin/" ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi
if [[ -d "$HOME/.cargo/bin" ]]; then
  export PATH="$HOME/.cargo/bin/:$PATH"
fi
# }}}

# GOPATH and GOBIN {{{
if [[ -d "$HOME/go" ]]; then
  export GOPATH=$HOME/go
  export GOBIN=$HOME/go/bin
fi
# }}}

# TEXMFHOME {{{
if [[ -d "$HOME/texmf" ]]; then
  export TEXMFHOME="$HOME/texmf"
fi
# }}}

# AWKPATH {{{
if [[ -d "/usr/share/awk" ]]; then
  export AWKPATH=".:/usr/share/awk"
fi
# }}}

# Exports {{{
# ls options
export LS_OPTIONS='--color=yes'

# man pages in color
export LESS_TERMCAP_mb=$(tput bold; tput setaf 1)
export LESS_TERMCAP_md=$(tput bold; tput setaf 1)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_se=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4)
export LESS_TERMCAP_ue=$(tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 2)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)

# Initialisation for par (text formatter)
export PARINIT='rTbgqR\ B=.,?_A_a Q=_s>|'

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Recommended by Pro Vim
export GITHUB_USER="gryndell"
export GREP_COLOR='mt=1;32'
export MANPAGER="less" # Clear the screen after quitting a manual page
export CLICOLOR=1

# Initialisation for par (text formatter)
export PARINIT="rTbgqR B=.,?_A_a Q=_s>|"
# Exports }}}

# Aliases {{{
# enable color support of ls and also add handy aliases
if [[ -x /usr/bin/dircolors ]]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || \
    eval "$(dircolors -b)"
  alias ls='ls -hCF --color=auto'
fi

if [[ "$TERM" == "xterm-kitty" ]]; then
  alias icat='kitty +kitten icat'
  alias kdiff='kitty +kitten diff'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# Useful aliases
if which bat &>/dev/null; then
  alias cat='bat -p'
fi
if which xsel &>/dev/null; then
  alias pbcopy='xsel --clipboard --input'
  alias pbpaste='xsel --clipboard --output'
fi

alias cp='cp -iv'
# alias xterm='xterm -font -*-fixed-medium-r-*-20-*-*-*-*-*-iso8859-16'
if which tty-clock &>/dev/null; then
  alias tty-clock='tty-clock -bcC5'
fi

# Always use extended regular expressions
alias sed='sed -E'

# }}} Aliases

# EDITOR {{{
export ALTERNATE_EDITOR="vi"
if which nvim &>/dev/null; then
  export EDITOR="nvim"      # $EDITOR should open in terminal
  export VISUAL="nvim"      # $VISUAL also nvim
  export GIT_EDITOR="nvim"  # GIT EDITOR
else
  if which vim &>/dev/null; then
    export EDITOR="vim"
    export VISUAL="vim"
    export GIT_EDITOR="vim"
  else
    export EDITOR="$ALTERNATE_EDITOR"
    export VISUAL="$ALTERNATE_EDITOR"
    export GIT_EDITOR="$ALTERNATE_EDITOR"
  fi
fi
export PAGER="less -R"    # PAGER
# }}}

# vim: foldmethod=marker
. "$HOME/.cargo/env"
