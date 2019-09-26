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
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# }}} Lines configured by zsh-newuser-install

# {{{ Some extra settings
setopt completealiases
setopt autocd autopushd pushdignoredups

_fix_cursor() {
    echo -ne '\e[3 q'
}

precmd_functions+=(_fix_cursor)
# }}} Some extra settings

# {{{ Prompt
bindkey -v
# autoload -Uz promptinit
# promptinit
NEWLINE=$'\n'
PROMPT='%F{magenta}%m%f:[%F{cyan}%~%f]
%(?.%F{green} ✔%f.%F{red} ✗%f):%(!.#.%%) '
# }}} Prompt
