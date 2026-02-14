#            _
#    _______| |__   ___ _ ____   __
#   |_  / __| '_ \ / _ \ '_ \ \ / /
#  _ / /\__ \ | | |  __/ | | \ V /
# (_)___|___/_| |_|\___|_| |_|\_/
#
# ~/.zshenv

# Exports {{{
## PATH
if [[ -d "$HOME/bin" ]]; then
  export PATH="$HOME/bin:$PATH"
fi
if [[ -d "$HOME/.local/bin/" ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi
if [[ -d "$HOME/.cargo/bin" ]]; then
  export PATH="$HOME/.cargo/bin/:$PATH"
fi

## GOPATH and GOBIN
if [[ -d "$HOME/go" ]]; then
  export GOPATH=$HOME/go
  export GOBIN=$HOME/go/bin
fi

## TEXMFHOME
if [[ -d "$HOME/texmf" ]]; then
  export TEXMFHOME="$HOME/texmf"
fi

## AWKPATH
if [[ -d "/usr/share/awk" ]]; then
  export AWKPATH=".:/usr/share/awk"
fi

## ls options
export LS_OPTIONS='--color=yes'

## man pages in color
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

## Initialisation for par (text formatter)
if which par &>/dev/null; then
  export PARINIT='rTbgqR\ B=.,?_A_a Q=_s>|'
fi

## colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

## Recommended by Pro Vim
export GITHUB_USER="gryndell"
export GREP_COLOR='mt=1;32'
export MANPAGER="less" # Clear the screen after quitting a manual page
export CLICOLOR=1

## Initialisation for par (text formatter)
export PARINIT="rTbgqR B=.,?_A_a Q=_s>|"

## PAGER
export PAGER="less -R"    # PAGER

## History
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
export HISTDUP=erase

## Color man pages
export MANROFFOPT="-c"

## Load Gemini API Key
if [[ -r $HOME/gemini.key ]]; then
  export GEMINI_API_KEY="$(cat $HOME/gemini.key)"
fi
# Exports }}}

# Aliases {{{
## enable color support of ls and also add handy aliases
if [[ -x /usr/bin/dircolors ]]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || \
    eval "$(dircolors -b)"
  alias ls='ls -hCF --color=auto'
fi

## Load kittens if using kitty
if [[ "$TERM" == "xterm-kitty" ]]; then
  alias icat='kitty +kitten icat'
  alias kdiff='kitty +kitten diff'
fi

## ls aliases
alias ll='ls -l'
alias la='ls -Al'
alias lt='ls -ltr'
alias l='ls -CF'
alias labc='ls -lap' # Sort alphabetically, show dotfiles

## Safe cp, mv, and rm
alias cp='cp -iv'
alias mv='mv -iv'
if which trash-put &>/dev/null; then
  alias rm='trash-put'
else
  alias rm='rm -i'
fi
alias indent='indent --linux-style --indent-level8'

## Some cd aliases
alias ..='cd ..'
alias cd..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

## Show progress when copying large file
alias cpv='rsync -ah --info=progress2'

## Grep with color by default
alias grep='grep --color=auto'

## Other aliases
if which lynx &>/dev/null; then
  alias lynx='lynx -editor=nvim -vikeys'
fi
if which wfh_log.sh &>/dev/null; then
  alias wfh='$HOME/bin/wfh_log.sh'
fi

## Switch between vi and emacs input mode
alias svi='set -o vi'
alias sem='set -o emacs'
alias indent='indent --linux-style --indent-level8 --no-tabs'

## alias vim to nvim, if possible
if which nvim &>/dev/null; then
  export EDITOR='nvim'
  export VISUAL='nvim'
  export GIT_EDITOR="nvim"  # GIT EDITOR
  alias vim='nvim'
else
  if which vim &>/dev/null; then
    export EDITOR='vim'
    export VISUAL='vim'
    export GIT_EDITOR="vim"  # GIT EDITOR
  else
    export EDITOR='vi'
    export VISUAL='vi'
    export GIT_EDITOR="vi"  # GIT EDITOR
  fi
fi

## Use bat, if it is available
if which bat &>/dev/null; then
  alias cat='bat -p'
fi

## Aliases for xsel if available
if which xsel &>/dev/null; then
  alias pbcopy='xsel --clipboard --input'
  alias pbpaste='xsel --clipboard --output'
fi

## tty-clock
if which tty-clock &>/dev/null; then
  alias tty-clock='tty-clock -bcC5'
fi

## Always use extended regular expressions
alias sed='sed -E'
# Aliases }}}


## If rust installed, initialize cargo
if [[ -r "$HOME/.cargo/env" ]]; then
  . "$HOME/.cargo/env"
fi

# vim: foldmethod=marker
