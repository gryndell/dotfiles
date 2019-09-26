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

# Suffix aliases
alias -s tex=vim
alias -s rb=vim
alias -s rs=vim
alias -s toml=vim
alias -s txt=vim
alias -s html=vim
alias -s vim=vim
alias -s wiki=vim
alias -s ms=vim
alias -s mom=vim
alias -s png=feh
alias -s {jpg,jpeg}=feh
alias -s gif=vim
alias -s ps=zathura
alias -s pdf=zathura

# }}} Aliases


