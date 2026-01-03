# PATH {{{
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  export PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.gem/ruby/2.7.0/bin" ]; then
  export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
fi
if [ -d "$HOME/.local/bin/" ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "$HOME/.vim/pack/minpac/start/fzf/bin" ]; then
  export PATH="$HOME/.vim/pack/minpac/start/fzf/bin:$PATH"
fi
# export PATH="$PATH:/usr/sbin:/sbin:pycharm-community-2017.2.4"
if [ -d "$HOME/.cargo/bin" ]; then
  export PATH="$HOME/.cargo/bin/:$PATH"
fi

# # Settings for Fuchsia
# export PATH=~/fuchsia/.jiri_root/bin:$PATH
# source ~/fuchsia/scripts/fx-env.sh

# }}}

# GOPATH and GOBIN {{{
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
# }}}

# WALLPATH {{{
export WALLPATH="$HOME/Wallpapers/Aenami"
# }}}

# TEXMFHOME {{{
export TEXMFHOME="$HOME/texmf"
# }}}

# AWKPATH {{{
export AWKPATH=".:/usr/share/awk"
# }}}

# Exports {{{
# ls options
export LS_OPTIONS='--color=yes'
export LESS='-X'
# man pages in color
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Initialisation for par (text formatter)
export PARINIT='rTbgqR\ B=.,?_A_a Q=_s>|'

# Ruby documentation
export RI="--format ansi -i"

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Recommended by Pro Vim
export GITHUB_USER="gryndell"
export GREP_COLOR='mt=1;32'
export MANPAGER="less -X" # Don’t clear the screen after quitting a manual page
export CLICOLOR=1

# Initialisation for par (text formatter)
export PARINIT="rTbgqR B=.,?_A_a Q=_s>|"

# Config for nnn
export NNN_OPTS="dDegHrRx"
export NNN_PLUG='f:finder;o:fzopen;p:mocplay;d:diffs;t:nmount;v:!ristretto $nnn;z:preview-tui'
export NNN_SEL='/tmp/.sel'
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_SSHFS='sshfs -o follow_symlinks'     # make sshfs follow symlinks on the remote
# export NNN_COLORS='1234'                        # use a different colour for each context
# export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'   # file-specific Colors
export NNN_TRASH=1                              # trash (using trash-cli) instead of delete
export NNN_BMS='h:~;d:~/Documents;t:~/Documents/Technical_Documents;w:~/Wallpapers'
export NNN_LOCKER='cmatrix'
export NNN_TMPFILE='/tmp/.lastd'

# For Flutter
export CHROME_EXECUTABLE="/usr/sbin/google-chrome-unstable"

# Exports }}}

# Aliases {{{
# enable color support of ls and also add handy aliases
if [[ -x /usr/bin/dircolors ]]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls -hCF --color=auto'
  # alias ls='exa -hF --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  #alias grep='grep --color=auto'
  #alias fgrep='fgrep --color=auto'
  #alias egrep='egrep --color=auto'
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
alias cat='bat -p'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

# alias rm="rm -i"
# if [[ $HOST == 'ishtar' ]]; then
#   alias rm='~/bin/newrm'
# fi
alias cp='cp -iv'
# alias xterm='xterm -font -*-fixed-medium-r-*-20-*-*-*-*-*-iso8859-16'
alias tty-clock='tty-clock -bcC5'
# alias tmux='tmux -u'

# alias nnn='nnn -egHrx'

alias sed='sed -E'

alias vim='nvim'
alias vimdiff='nvim -d'

alias yeet='paru -Rcs'

# alias less='/usr/share/nvim/runtime/macros/less.sh'

# Suffix aliases
alias -s tex=nvim
alias -s rb=nvim
alias -s rs=nvim
alias -s toml=nvim
alias -s txt=nvim
alias -s html=nvim
alias -s nvim=vim
alias -s wiki=nvim
alias -s ms=nvim
alias -s mom=nvim
alias -s png=feh
alias -s {jpg,jpeg}=feh
alias -s gif=nvim
alias -s ps=zathura
alias -s pdf=zathura
alias clear='[ $[$RANDOM % 10] = 0 ] && timeout 6 cbeams -o; clear || clear'

# nnn
# alias nnn='nnn -egHrx'

# }}} Aliases

# EDITOR {{{
export ALTERNATE_EDITOR=""
export EDITOR="nvim"      # $EDITOR should open in terminal
export VISUAL="nvim"      # $VISUAL also nvim
export PAGER="less -R"    # PAGER
export GIT_EDITOR="nvim"  # GIT EDITOR
export VIMRUNTIME="/usr/share/nvim/runtime"
# }}}

# vim: foldmethod=marker
. "$HOME/.cargo/env"
