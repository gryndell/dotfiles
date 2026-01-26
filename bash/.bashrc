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

# Some ls aliases
alias ls='ls --color=always'
alias ll='ls -l'
alias la='ls -Al'
alias lt='ls -ltr' # Sort by date
alias labc='ls -lap' # Sort alphabetically, show dotfiles

# Map vi/vim to nvim
alias vi='nvim'
alias vim='nvim'

# Some cd aliases
alias ..='cd ..'
alias cd..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Safe cp, mv, and rm
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='trash-put'

# Show progress when copying large file
alias cpv='rsync -ah --info=progress2'

# Grep with color by default
alias grep='grep --color=auto'

# Other aliases
alias update='sudo dnf offline-upgrade download -y && sudo dnf offline-upgrade reboot'
alias indent='indent --linux-style --indent-level8 --no-tabs'
alias luamake=/home/ralph/lua-language-server/3rd/luamake/luamake
alias lynx='lynx -editor=nvim -vikeys'
alias wfh='$HOME/bin/wfh_log.sh'
# Switch between vi and emacs input mode
alias svi='set -o vi'
alias sem='set -o emacs'

# cdspell
shopt -s cdspell
# Auto CD into directories
shopt -s autocd

# Set neovim as the editor
export EDITOR=nvim

# Use nvim to view manpages
export MANPAGER='nvim +Man!'

# Load Gemini API Key
export GEMINI_API_KEY="$(cat $HOME/gemini.key)"

# Find string in files
fstr() {
  grep -Rnw "." -e "$1"
}

# Google search and open in lynx
google() {
    local query="$*"
    if [ -z "$query" ]; then
        lynx "https://www.google.com"
    else
        query=$(echo "$query" | jq -sRr @uri)
        lynx "https://www.google.com/search?q=$query"
    fi
}

source /home/ralph/.config/broot/launcher/bash/br
# . "$HOME/.cargo/env"

# Use vi keybindings
set -o vi
# Set Ctrl+l to be clear screen a la emacs bindings
bind -x '"\C-l":clear'

# Set time format for history
export HISTCONTROL=ignoreboth
HISTTIMEFORMAT="%F %T "

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
eval "$(atuin init bash --disable-up-arrow)"

