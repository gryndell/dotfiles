# Check whether interactive {{{
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# }}}

# Shell Options {{{
# Disable ctrl-s and ctrl-q
# Allows for search-forward in bash history
stty -ixon
# Vi-like keybinding
set -o vi


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# }}}

# History Settings {{{
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# }}}

# Prompt settings {{{

# set a fancy prompt (non-color, unless we know we "want" color)
export TERM="xterm-256color"
case "$TERM" in
  xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  # PS1='┌(\033[38;5;13m\]\u@\h\[\033[00m\])\n└[\[\033[38;5;10m\]\w\[\033[00m\]]\$ '
# else
  # PS1='┌(\u@\h)\n└[\w]\$ '
  PS1='\033[38;5;13m\]\h\[\033[00m\]:[\[\033[38;5;10m\]\w\[\033[00m\]]\n$ '
else
  PS1='\u@\h:[\w]\n$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
  *)
    ;;
esac

# }}}

# Aliases {{{
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  #alias grep='grep --color=auto'
  #alias fgrep='fgrep --color=auto'
  #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

alias emax="emacs -nw -q -l ~/.emacs.d/chui.el"
alias semac="sudo emacs -nw -q -l /home/ralph/.emacs.d/chui.el"
# alias rm="rm -i"
alias rm='~/bin/newrm'
alias cp='cp -iv'
alias xterm='xterm -font -*-fixed-medium-r-*-20-*-*-*-*-*-iso8859-16'
alias tty-clock='tty-clock -bcC5'
# alias tmux='tmux -u'

# Archlinux upgrade
alias upgrade='sudo pacman -Syu'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# }}}

# Bash Completion {{{
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# }}}

# Functions and helpers {{{
# TheFuck command line spell-checker
eval "$(thefuck --alias)"

# Note function
note () {
  local notes_dir="$HOME/vimwiki"
  case "$1" in
    b)
      cp -r "$notes_dir/*" "$HOME/Dropbox/notes/"
      ;;
    c)
      cd "$notes_dir"
      ;;
    l)
      ls "$notes_dir"
      ;;
    p)
      pushd "$notes_dir"
      msg="Regenerated at $(date -u '+%Y-%m-%d %H:%M:%S') UTC"
      git add .
      git commit -m "$msg"
      git push origin master
      popd
      ;;
    *)
      vim "$notes_dir/$1"
  esac
}

# Blur konsole
# konsolex=$(qdbus | grep konsole | cut -f 2 -d\ )
# if [ -n "$konsolex" ]; then
#   for konsole in `xdotool search --class konsole`; do
#     xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $konsole;
#   done
# fi
# fortune -a

# Vim server
alias vim='vim --servername vim'
alias vi='vim --servername vim'

# Use figlet with custom future font
alias figfuture='figlet -f ~/figlet-fonts/future'

# }}}

source /home/ralph/.config/broot/launcher/bash/br
