# {{{ Functions
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

function zsh_add_file() {
  [ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}

function zsh_add_plugin() {
  PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
  if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then
    zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
    zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
  else
    git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
  fi
}

function zsh_add_completion() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then
        # For completions
    completion_file_path=$(ls $ZDOTDIR/plugins/$PLUGIN_NAME/_*)
    fpath+="$(dirname "${completion_file_path}")"
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh"
    else
        git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
    fpath+=$(ls $ZDOTDIR/plugins/$PLUGIN_NAME/_*)
        [ -f $ZDOTDIR/.zccompdump ] && $ZDOTDIR/.zccompdump
    fi
  completion_file="$(basename "${completion_file_path}")"
  if [ "$2" = true ] && compinit "${completion_file:1}"
}

function set_win_title() {
  echo -ne "\033]0; ${PWD/\/home\/ralph/~} \007"
}
precmd_functions+="set_win_title"

# }}} Functions

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

# {{{ Options
setopt completealiases
setopt autocd autopushd pushdignoredups
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS

# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"

# Command not found handler
source /usr/share/doc/pkgfile/command-not-found.zsh

# Autosuggestions fish-style
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
zsh_add_plugin "zsh-users/zsh-autosuggestions"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# }}} Options

# {{{ Prompt
bindkey -v
KEYTIMEOUT=5
NEWLINE=$'\n'

# # Use underscore cursor for each new prompt.
# make_underscore() {
#   echo -ne '\e[3 q'
# }

# preexec() {
#   echo -ne '\e[3 q'
# }
# # Use underscore cursor on startup and each new prompt.
# make_underscore
# autoload -U add-zsh-hook
# add-zsh-hook preexec make_underscore

# Enable editing commands in nvim with ESC-v
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
# autoload -Uz promptinit
# promptinit
# PROMPT='%F{magenta}%m%f:[%F{cyan}%~%f]
# %(?.%F{green} ✔%f.%F{red} ✗%f):%(!.#.%%) '
# PROMPT='[%F{cyan}%~%f]
# %(?.%F{green} ✔%f.%F{red} ✗%f):%(!.#.%%) '
eval "$(starship init zsh)"
# }}} Prompt

# {{{ Neofetch
if [[ "$TERM" == "xterm-kitty" ]]; then
  /usr/bin/neofetch --disable title --kitty /usr/share/pixmaps/archlinux-logo.svg
else
  /usr/bin/neofetch --disable title | lolcat
fi
# }}} Neofetch

# {{{ nnn
n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, either remove the "export" as in:
    #    NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    #    (or, to a custom path: NNN_TMPFILE=/tmp/.lastd)
    # or, export NNN_TMPFILE after nnn invocation
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # nnn "$@"
    nnn -P z -t 600

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}
# }}} nnn

# vim: set foldmethod=marker

source /home/ralph/.config/broot/launcher/bash/br
