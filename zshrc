# {{{ Lines added by compinstall
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/ralph/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# }}} Lines added by compinstall

# {{{ Lines configured by zsh-newuser-install
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
# ignore common commands
export HISTIGNORE=":pwd:id:uptime:resize:ls:clear:history:"
export HISTCONTROL=ignoredups
# End of lines configured by zsh-newuser-install
# }}} Lines configured by zsh-newuser-install

# {{{ Some extra settings
setopt completealiases
setopt autocd autopushd pushdignoredups

# _fix_cursor() {
#     echo -ne '\e[3 q'
# }

# precmd_functions+=(_fix_cursor)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Command not found handler
source /usr/share/doc/pkgfile/command-not-found.zsh

# }}} Some extra settings

# {{{ Prompt
bindkey -v
KEYTIMEOUT=5

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} == '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[3 q'
  fi
}
zle -N zle-keymap-select

# Use underscore cursor for each new prompt.
make_underscore() {
  echo -ne '\e[3 q'
}

preexec() {
  echo -ne '\e[3 q'
}
# Use underscore cursor on startup and each new prompt.
make_underscore
autoload -U add-zsh-hook
add-zsh-hook preexec make_underscore

# autoload -Uz promptinit
# promptinit
NEWLINE=$'\n'
# PROMPT='%F{magenta}%m%f:[%F{cyan}%~%f]
# %(?.%F{green} ✔%f.%F{red} ✗%f):%(!.#.%%) '
PROMPT='[%F{cyan}%~%f]
%(?.%F{green} ✔%f.%F{red} ✗%f):%(!.#.%%) '
# }}} Prompt
