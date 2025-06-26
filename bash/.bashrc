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

# Other aliases
alias update='sudo dnf offline-upgrade download -y && sudo dnf offline-upgrade reboot'
alias indent='indent --linux-style --indent-level8 --no-tabs'
alias luamake=/home/ralph/lua-language-server/3rd/luamake/luamake
alias lynx='lynx -editor=nvim -vikeys'
alias wfh='$HOME/bin/wfh_log.sh'
# Switch between vi and emacs input mode
alias svi='set -o vi'
alias sem='set -o emacs'

# Auto CD into directories
shopt -s autocd

# Set neovim as the editor
export EDITOR=/usr/bin/nvim

# Use nvim to view manpages
export MANPAGER='nvim +Man!'

# Find string in files
fstr() {
  grep -Rnw "." -e "$1"
}

source /home/ralph/.config/broot/launcher/bash/br
# . "$HOME/.cargo/env"

set -o vi

# Set time format for history
HISTTIMEFORMAT="%F %T "

PROMPT_COMMAND=__prompt_command     # Function to generate PS1 after CMDs

__prompt_command() {
  local EXIT="$?"                   # This needs to be first
  PS1=""
  local RCol='\[\e[0m\]'
  local Red='\[\e[0;31m\]'
  local Gre='\[\e[0;32m\]'
  local BYel='\[\e[1;33m\]'
  local BBlu='\[\e[1;34m\]'
  local Pur='\[\e[0;35m\]'

  if [ $EXIT != 0 ]; then
    RESULT="${Red}"         # Add red if exit code non 0
  else
    RESULT="${Gre}"
  fi

  PS1+="$RESULT╭─(${BYel}\u${RCol}@${BBlu}\h$RESULT)─[${RCol}\w$RESULT]\n╰─$ ${RCol}"
}
eval "$(atuin init bash --disable-up-arrow)"

