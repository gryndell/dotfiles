#    _               _
#   | |__   __ _ ___| |__  _ __ ___
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__
# (_)_.__/ \__,_|___/_| |_|_|  \___|
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases {{{
# Some ls aliases
alias ls='ls --color=always'
alias ll='ls -l'
alias la='ls -Al'
alias lt='ls -ltr' # Sort by date
alias l='ls -CF'
alias labc='ls -lap' # Sort alphabetically, show dotfiles

# Safe cp, mv, and rm
alias cp='cp -iv'
alias mv='mv -iv'
if which trash-put &>/dev/null; then
  alias rm='trash-put'
else
  alias rm='rm -i'
fi

# Some cd aliases
alias ..='cd ..'
alias cd..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Show progress when copying large file
alias cpv='rsync -ah --info=progress2'

# Grep with color by default
alias grep='grep --color=auto'

# Other aliases
if which lynx &>/dev/null; then
  alias lynx='lynx -editor=nvim -vikeys'
fi
if which wfh_log.sh &>/dev/null; then
  alias wfh='$HOME/bin/wfh_log.sh'
fi

# Switch between vi and emacs input mode
alias svi='set -o vi'
alias sem='set -o emacs'
alias indent='indent --linux-style --indent-level8 --no-tabs'

if which nvim &>/dev/null; then
  export EDITOR='nvim'
  export VISUAL='nvim'
  alias vi='nvim'
  alias vim='nvim'
else
  if which vim &>/dev/null; then
    export EDITOR='vim'
    export VISUAL='vim'
    alias vi='vim'
  fi
fi
# Aliases }}}

# Shell options {{{
# cdspell
shopt -s cdspell
# dirspell
shopt -s dirspell
# Auto CD into directories
shopt -s autocd
# Shell options }}}

# Exports {{{
## Support colors in less
export LESS_TERMCAP_mb=$(tput bold; tput setaf 1)
export LESS_TERMCAP_md=$(tput bold; tput setaf 1)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_se=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4)
export LESS_TERMCAP_ue=$(tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 2)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)

## Color man pages
export MANROFFOPT="-c"

## Load Gemini API Key
if [[ -r $HOME/gemini.key ]]; then
  export GEMINI_API_KEY="$(cat $HOME/gemini.key)"
fi

## Set time format for history
export HISTCONTROL=ignoreboth
HISTTIMEFORMAT="%F %T "

## Use vi keybindings
set -o vi

## Set Ctrl+l to be clear screen a la emacs bindings
bind -x '"\C-l":clear'
# Exports }}}

# Functions {{{
## Find string in files
fstr() {
  grep -Rnw "." -e "$1"
}

## Google search and open in lynx
google() {
    local query="$*"
    if [ -z "$query" ]; then
        lynx "https://www.google.com"
    else
        query=$(echo "$query" | jq -sRr @uri)
        lynx "https://www.google.com/search?q=$query"
    fi
}
# Functions }}}

# Prompt {{{
PROMPT_COMMAND=__prompt_command     # Function to generate PS1 after CMDs

__prompt_command() {
  local EXIT="$?"                   # This needs to be first
  PS1=""
  local NORMAL='\[\e[0m\]'
  local RED='\[\e[0;31m\]'
  local GREEN='\[\e[0;32m\]'
  local YELLOW='\[\e[0;33m\]'
  local BLUE='\[\e[0;34m\]'
  local MAGENTA='\[\e[0;35m\]'
  local CYAN='\[\e[0;36m\]'

  if [ $EXIT != 0 ]; then
    RESULT="${RED}"         # Add red if exit code non 0
  else
    RESULT="${GREEN}"
  fi

  PS1+="$RESULT╭─(${CYAN}\u@\h${NORMAL}$RESULT)─[${NORMAL}\w"
  PS1+="$RESULT]\n$RESULT╰─$ ${NORMAL}"
  printf "\033]0;%s@%s:%s\007" "$USER" "$HOSTNAME" "${PWD/#$HOME/\~}"
}
# Prompt }}}

# Use atuin for history search, if installed
if which atuin &>/dev/null; then
  eval "$(atuin init bash --disable-up-arrow)"
fi

# vim: foldmethod=marker
